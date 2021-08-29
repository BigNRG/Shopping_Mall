//
//  HomeVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/10/21.
//

import UIKit

protocol Storyborded {
    static func instance() ->Self
}

extension Storyborded where Self: UIViewController {
    static func instance() ->Self {
        let id = String.init(describing: self)
        let storybord = UIStoryboard.init(name: "Main", bundle: .main)
        let vc = storybord.instantiateViewController(identifier: id)
        return vc as! Self
    }
    
}

class HomeVC: UIViewController {
    private var adsWithCategories = [AdsWithCategory]()
    
    var promptDataSource = [Description]()
    
    var searchTableView = UITableView()
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mainPageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transparentNavigationBar()
        topView.shadowMyView()
        
        searchBar.backgroundImage = UIImage()
        
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.frame = CGRect(x: 0, y: searchBar.frame.origin.y + searchBar.frame.height + 40, width: self.view.frame.width, height: self.view.frame.height)
        searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellSearch")
        
        
        
        mainPageTableView.delegate = self
        mainPageTableView.dataSource = self
        
        hideKeyboardWhenTappedAround()
        GeneralRequestManager.loadMainPage { [weak self] loadedMainPage in
            self?.adsWithCategories = loadedMainPage?.adsWithCategories ?? []
            self?.mainPageTableView.reloadData()
        }
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        var count = 0
        
        if tableView == mainPageTableView{
            count = adsWithCategories.count
        }
        if tableView == searchTableView{
            count = 1
        }
        
        return count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        
        if tableView == mainPageTableView{
            count = 1
        }
        if tableView == searchTableView{
            return promptDataSource.count
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == mainPageTableView{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "categoryAdsTableViewCell", for: indexPath) as! CategoryAdsTableViewCell
            cell2.onProductPress = { (selectedProductIndex) in
                print("Selected Product: ", selectedProductIndex, "from section: ", indexPath.section)
            }
            cell2.ads = adsWithCategories[indexPath.section].ads
            
            return cell2
        }
        if tableView == searchTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellSearch", for: indexPath)
            let prompt = promptDataSource[indexPath.row]
            cell.textLabel?.text = prompt.searchString
            print("testPrompt \(prompt.searchString)")
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == searchTableView{
            return nil
        }
        return adsWithCategories[section].category.name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == searchTableView{
            let prompt = promptDataSource[indexPath.row]
            let vc = SearchResultNavigationController.instance()
            vc.modalPresentationStyle = .fullScreen
            if let searchVC = vc.viewControllers.first, searchVC.isKind(of: SearchPageVC.self) {
                (searchVC as! SearchPageVC).prompt = prompt.searchString
            }
            self.present(vc, animated: true, completion: nil)
            //  self.performSegue(withIdentifier: "showSearchRezulte", sender: self)
        }
        
    }
    
    
    
}
extension HomeVC: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty && searchText.count < 2{
            self.view.addSubview(searchTableView)
            let prompt = Prompt.init(countryID: 1, symbol: searchText)
            self.configuresearchBar(prompt: prompt)
        }else {
            promptDataSource.removeAll()
            searchTableView.reloadData()
        }
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchTableView.removeFromSuperview()
        searchBar.text = nil
        
    }
    func configuresearchBar(prompt: Prompt ){
        PromptDataManager.searchPrompt(prompt: prompt) {[weak self] (resurl) in
            
            switch resurl{
            case .success(let descriptions):
                DispatchQueue.main.async {
                    self?.promptDataSource = descriptions
                    self?.searchTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
}
