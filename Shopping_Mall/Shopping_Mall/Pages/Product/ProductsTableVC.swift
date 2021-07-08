//
//  ProductsTableVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/16/21.
//

import UIKit

class ProductsTableVC: UITableViewController {
    
    var loadedSales = GetSaleElements()
    var loadedWorks = GetWorkElements()
    var loadedRealEstate = RealEstateElements()
    var loadedSport = GetSportElements()
    var loadedElectronics = GetElectronicsElements()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(loadedSport.count)
        return loadedSport.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productsTableViewCell", for: indexPath) as! ProductsTableViewCell
        cell.productImageView.image = #imageLiteral(resourceName: "noImage") //loadedSales[indexPath.row].imagesList
        cell.productImageView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        cell.productImageView.layer.borderWidth = 1
        cell.productImageView.layer.cornerRadius = 10
        cell.productNameLabel.text! = loadedSport[indexPath.row].name
        cell.productDescriptionLabel.text! = loadedSport[indexPath.row].getSportElementDescription
        cell.productPriceLabel.text! = "\(loadedSport[indexPath.row].price)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        AdGetRequestManager.loadSingleSale(id: loadedSales[indexPath.row].id) { [weak self] loadedSingleSalesData in
        //            let vc = self?.storyboard?.instantiateViewController(withIdentifier: "GetPageVC") as! GetPageVC
        //            vc.loadedSingleSales = loadedSingleSalesData ?? []
        //            self?.navigationController?.pushViewController(vc, animated: true)
        //        }
//                AdGetRequestManager.loadSingleWork(id: loadedWorks[indexPath.row].id) { [weak self] loadedSingleWorksData in
//                    let vc = self?.storyboard?.instantiateViewController(withIdentifier: "GetPageVC") as! GetPageVC
//                    vc.loadedSingleWorks = loadedSingleWorksData ?? []
//                    self?.navigationController?.pushViewController(vc, animated: true)
//                }
//        AdGetRequestManager.loadSingleRealEstate(id: loadedRealEstate[indexPath.row].id) { loadedRealEstateData in
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "GetPageVC") as! GetPageVC
//
//            vc.loadedRealEstate = loadedRealEstateData ?? []
//            print("uiuuiuiui \(self.loadedRealEstate)")
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        AdGetRequestManager.loadSingleSport(id: loadedSport[indexPath.row].id) { loadedSportData in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "GetPageVC") as! GetPageVC


            vc.loadedSport = loadedSportData ?? []
            print("uiuuiuiui \(self.loadedSport)")
            self.navigationController?.pushViewController(vc, animated: true)
        }
//        AdGetRequestManager.loadSingleElectronics(id: loadedElectronics[indexPath.row].id) { loadedElectronicsData in
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "GetPageVC") as! GetPageVC
//
//                    vc.loadedElectronicsData = loadedRealEstateData ?? []
//                    print("uiuuiuiui \(self.loadedRealEstate)")
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
    }

//    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
//     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
