//
//  AddSubCategoriesTableVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 6/4/21.
//

import UIKit

class AddSubCategoriesTableVC: UITableViewController {
    var selectedCagegoryID = 0
    var addSubcategoryTitle = ""
    var addSubCategories = [SubCategory]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView() // remove unused cells
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Ընտրեք Սաբկատեգորիան"
        self.tableView.reloadData()
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return addSubCategories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addSubCategoriesTableViewCell", for: indexPath) as! AddSubCategoriesTableViewCell
        cell.addSubCategoryNameLabel.text = addSubCategories[indexPath.row].type
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let subcategoryid = subCategories[indexPath.row].id
        AdGetRequestManager.loadSales(pageNumber: 1, adCount: 20, subCategoryID: 1) { loadedSalesData in
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddVC_ID") as! AddVC
//            vc.loadedSales = loadedSalesData ?? []
            let vc = self.storyboard?.instantiateViewController(identifier: "AddVC_ID") as! AddVC
            vc.selectedCagegoryID = self.selectedCagegoryID
            vc.selectedSubCategoryID = self.addSubCategories[indexPath.row].id
            print("Selected Subcategory: ", self.addSubCategories[indexPath.row].type)
            print("Selected SubcategoryID: ", self.addSubCategories[indexPath.row].id)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
