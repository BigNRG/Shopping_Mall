//
//  CategoryAdsTableViewCell.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/29/21.
//

import UIKit

class CategoryAdsTableViewCell: UITableViewCell {
    
    var ads = [Ad]()
    
    @IBOutlet weak var categoryAdsCollectionView: UICollectionView!
    
    var onProductPress: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryAdsCollectionView.delegate = self
        categoryAdsCollectionView.dataSource = self
        categoryAdsCollectionView.reloadData()
    }
    
    override func prepareForReuse() {
        categoryAdsCollectionView.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension CategoryAdsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ads.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "adsCollectionViewCell", for: indexPath) as! AdsCollectionViewCell
        cell.productIDLabel.text = "ID: \(ads[indexPath.row].id)"
//        cell.productPriceLabel.text = "\(ads[indexPath.row].)"
        print("Image URL: ", ads[indexPath.row].image)
        if ads[indexPath.row].image.isEmpty {
            cell.productImageView.image = #imageLiteral(resourceName: "noImage")
        }
        else {
            if let imageURL = URL(string: ads[indexPath.row].image) {
                cell.productImageView.downloadImageFromURL(url: imageURL)
            }
        }
        cell.productNameLabel.text = ads[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.onProductPress?(indexPath.row)
        print("FromCollectionView Selected Product: ", indexPath.row)
    }
    
}
