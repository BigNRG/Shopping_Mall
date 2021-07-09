//
//  SearchPageVC.swift
//  Shopping_Mall
//
//  Created by Harut on 01.07.21.
//

import UIKit

class SearchPageVC: UIViewController, Storyborded, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var prompt: String?
    var dataManager = SearchDataManager.shared
    
    var searchProduct = [RealEstateElement?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()

    }
    
    func fetchData() {
        if let searchPrompt = self.prompt {
            dataManager.fatchData(forPrompt: searchPrompt) { [weak self] response in
                switch response {
                case .success(let result):
                    DispatchQueue.main.async {
                        self?.searchProduct = result
                        self?.collectionView.reloadData()
                    }
//                    print("respons cod \(response)")
                case .failure(let error):
                    print("did resive error \(error.localizedDescription)")
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SearchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SearchCollectionViewCell
        let product = searchProduct[indexPath.row]
//        cell.coverImageView.image = product?.imagesList[indexPath.row]
        cell.textLabel.text = product?.name
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (self.view.frame.width / 2) - 5, height: self.view.frame.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }

    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
