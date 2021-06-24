//
//  ProductVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/17/21.
//

import UIKit

class ProductVC: UIViewController {
    var loadedSingleSales = GetSale()

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productIDLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productImageView.image = #imageLiteral(resourceName: "noImage")
        productNameLabel.text = loadedSingleSales[0].name
        productPriceLabel.text = "\(loadedSingleSales[0].price)"
        productDescriptionLabel.text = loadedSingleSales[0].getSaleDescription
        productIDLabel.text = "ID: \(loadedSingleSales[0].id)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
