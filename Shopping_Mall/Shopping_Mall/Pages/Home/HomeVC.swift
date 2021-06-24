//
//  HomeVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/10/21.
//

import UIKit

class HomeVC: UIViewController {
    private var adsWithCategories = [AdsWithCategory]()
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mainPageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavigationBar()
        topView.shadowMyView()
        searchBar.backgroundImage = UIImage()
        hideKeyboardWhenTappedAround()
        GeneralRequestManager.loadMainPage { [weak self] loadedMainPage in
            self?.adsWithCategories = loadedMainPage?.adsWithCategories ?? []
            self?.mainPageTableView.reloadData()
        }
    }
    
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return adsWithCategories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryAdsTableViewCell", for: indexPath) as! CategoryAdsTableViewCell
        //on product press closure
        cell.onProductPress = { (selectedProductIndex) in
            print("Selected Product: ", selectedProductIndex, "from section: ", indexPath.section)
        }
        cell.ads = adsWithCategories[indexPath.section].ads
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return adsWithCategories[section].category.name
    }
    
    
}

