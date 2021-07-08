//
//  SubCategoriesTableVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/16/21.
//

import UIKit

class SubCategoriesTableVC: UITableViewController {
    var subcategoryTitle = ""
    var subCategories = [SubCategory]()
    var categories = [Category]()
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
        self.title = subcategoryTitle
        self.tableView.reloadData()
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subCategories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subCategoriesTableViewCell", for: indexPath) as! SubCategoriesTableViewCell
        cell.subCategoryNameLabel.text = subCategories[indexPath.row].type
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
//        let subcategoryid = subCategories[indexPath.row].id
//        AdGetRequestManager.loadRealEstate(pageNumber: 1, adCount: 20, subCategoryID: 2) { loadedRealEstate in
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductsTableVC_ID") as! ProductsTableVC
//            vc.loadedRealEstate = loadedRealEstate ?? []
//            print("vc.loadedRealEstate \(vc.loadedRealEstate)")
//            print("SubCategoryID: ", self.subCategories[indexPath.row].id)
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//        AdGetRequestManager.loadRealEstate(pageNumber: 1, adCount: 20, subCategoryID: 4) { loadedElectronics in
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductsTableVC_ID") as! ProductsTableVC
//            vc.loadedElectronics = loadedElectronics ?? []
////            print("vc.loadedRealEstate \(vc.loadedRealEstate)")
////            print("SubCategoryID: ", self.subCategories[indexPath.row].id)
//            self.navigationController?.pushViewController(vc, animated: true)
//
//        }
        
//        switch categories[0].id {
//            case 1:
//
//        }
        AdGetRequestManager.loadSports(pageNumber: 1, adCount: 20, subCategoryID: subCategories[0].id) { loadedSport in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductsTableVC_ID") as! ProductsTableVC
            vc.loadedSport = loadedSport ?? []
            print("vc.loadedRealEstate \(vc.loadedSport)")
            print(loadedSport?.count)
            print("SubCategoryID: ", self.subCategories[indexPath.row].id)
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
  

}
