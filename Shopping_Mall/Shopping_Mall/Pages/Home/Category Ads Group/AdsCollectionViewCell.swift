//
//  AdsCollectionViewCell.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/29/21.
//

import UIKit

class AdsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productIDLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    override func prepareForReuse() {
        productImageView.image = #imageLiteral(resourceName: "loadingImage")
    }
}

