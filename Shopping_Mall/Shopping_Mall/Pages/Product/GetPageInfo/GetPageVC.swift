//
//  GetPageVC.swift
//  Shopping_Mall
//
//  Created by User on 04.06.21.
//

import UIKit

class GetPageVC: UIViewController {

    var loadedSingleSales = GetSaleElements()
    var loadedSingleWorks = GetWorkElements()
    var loadedRealEstate = RealEstateElements()
    var loadedSport = GetSportElements()
    var loadedElectronics = GetElectronicsElements()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var arr: [Any] = ["Barev", "The first known examples of a team game involving a ball, which was made out of a rock, occurred in old Mesoamerican cultures for over 3,000 years ago. It was by the Aztecs called Tchatali, although various versions of the game were spread over large regions. In some ritual occasions, the ball would symbolize the sun and the captain of the losing team would be sacrificed to the gods. A unique feature of the Mesoamerican ball game versions was a bouncing ball made of rubber – no other early culture had access to rubber. Bari ereko It took, however, long time until the features of today’s football had been taken into practice. For a long time there wa no clear distinction between football and rugby. ", "Cell 3", "Cell 4", "Cell 5", "Cell 6"]
    
    let firma = "Mercedes"
    let model = "G63"
    let year = "2021"
    let price = 106000
    
    let country = "Հայաստան"
    let region = "Սյունիք"
    let city = "Անգեղակոթ"
    
    let contactData = "Կոնտակտային տվյալ"
//    let phoneNumber = "094231323"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
////
//        tableView.estimatedRowHeight = tableView.rowHeight
////        tableView.rowHeight = UITableViewAutomaticDimantion
//        tableView.rowHeight = UITableView.automaticDimension
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

}

extension GetPageVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }


}

extension GetPageVC: UITableViewDataSource {



//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 300
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 100
//    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
                let image = UIImage(named: "woman")
                cell.setPostedImage(image: image!)
                cell.urgentLabel.isHidden = false
                cell.vipLabel.isHidden = true
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! TableViewCell
                cell.ownerLabel.text = "Диллер"
                cell.aimLabel.text = "Վարձակալություն"
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! TableViewCell
//              cell.firmaModelYearLabel.text = firma + " " + model + ", " + year
//                print(loadedRealEstate[0].cityName)
//                cell.firmaModelYearLabel.text = loadedRealEstate[0].name
//                cell.priceLabel.text = "$ " + String(price)
//                  cell.priceLabel.text = String(loadedRealEstate[0].price)
                cell.priceLabel.text = String(loadedSport[0].price)
                print(loadedSport[0].cityName)
                cell.firmaModelYearLabel.text = loadedSport[0].name
                cell.priceLabel.text = "$ " + String(price)
                cell.priceLabel.text = String(loadedSport[0].price)
                
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! TableViewCell
                cell.contactData.text = contactData
//                cell.phoneNumber.setTitle(loadedRealEstate[0].contact, for: .normal)
//                print(loadedRealEstate[0].constructionType)
//                print(loadedRealEstate[0].currency)
//                print(loadedRealEstate[0].contact)
                cell.phoneNumber.setTitle(loadedSport[0].contact, for: .normal)
                
                
//                cell.phoneNumber.setAttributedTitle(<#T##title: NSAttributedString?##NSAttributedString?#>, for: <#T##UIControl.State#>)
                cell.loadedSport = loadedSport
                

                return cell
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath) as! TableViewCell
//                cell.countryRegionCityLabel.text = loadedRealEstate[0].countryName + " ~ " + loadedRealEstate[0].regionName + " ~ " + loadedRealEstate[0].cityName
                cell.countryRegionCityLabel.text = loadedSport[0].countryName + " ~ " + loadedSport[0].regionName + " ~ " + loadedSport[0].cityName
                
                return cell
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell6", for: indexPath) as! TableViewCell
                //cell.setInfo(<#T##info: [(String, String)]##[(String, String)]#>) //by Artur
                
                
                cell.setInfo([("Վազքը", loadedSport[0].name), ("Փոխանցման տուփը", loadedSport[0].cityName), ("Փոխանցման տուփը", loadedSport[0].name), ("Փոխանցման տուփը", loadedSport[0].cityName),])
                
                return cell
            case 6:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell7", for: indexPath) as! TableViewCell
//                cell.descriptionLabel.text = loadedRealEstate[0].realEstateElementDescription
                cell.descriptionLabel.text = loadedSport[0].getSportElementDescription
                
                return cell
            case 7:
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell8", for: indexPath) as! TableViewCell
                cell.profileButton.setTitle("Profile", for: .normal)
                return cell

                
            default:
                break


        }
        
        return TableViewCell()

    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }

}
