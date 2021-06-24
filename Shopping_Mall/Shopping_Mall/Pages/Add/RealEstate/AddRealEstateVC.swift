//
//  AddRealEstateVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 6/17/21.
//

import UIKit
import iOSDropDown
class AddRealEstateVC: UIViewController {
    @IBOutlet weak var aimView: UIView!
    @IBOutlet weak var aimLabel: UILabel!
    @IBOutlet weak var aimDropDown: DropDown!
    
    @IBOutlet weak var ownerView: UIView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var ownerDropDown: DropDown!
    
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryDropDown: DropDown!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionDropDown: DropDown!
    @IBOutlet weak var city_districtLabel: UILabel!
    @IBOutlet weak var city_districtDropDown: DropDown!
    @IBOutlet weak var locationOnMapButton: UIButton!
    
    @IBOutlet weak var currencyAndPriceView: UIView!
    @IBOutlet weak var currencyAndPriceLabel: UILabel!
    @IBOutlet weak var currencyDropDown: DropDown!
    @IBOutlet weak var priceTextField: UITextField!
    
    @IBOutlet weak var nameAndTagsView: UIView!
    @IBOutlet weak var nameAndTagsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tagsTextField: UITextField!
    
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var phoneNumberView: UIView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var imagesView: UIView!
    @IBOutlet weak var imagesLabel: UILabel!
    @IBOutlet weak var uploadImageCollectionView: UICollectionView!
    
    @IBOutlet weak var spaceView: UIView!
    @IBOutlet weak var spaceLabel: UILabel!
    @IBOutlet weak var spaceTextfield: UITextField!
    
    @IBOutlet weak var floorRoomsConsTypeView: UIView!
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var floorDropDown: DropDown!
    @IBOutlet weak var roomsLabel: UILabel!
    @IBOutlet weak var roomsDropDown: DropDown!
    @IBOutlet weak var constructionTypelabel: UILabel!
    @IBOutlet weak var constructionTypeDropDown: DropDown!
    
    @IBOutlet weak var productStateView: UIView!
    @IBOutlet weak var productStateLabel: UILabel!
    @IBOutlet weak var productStateDropDown: DropDown!
    
    var uploadedImagesArray = [#imageLiteral(resourceName: "noImage")]
    var realEstate = ["id": 0, //ignor
                      "userID": 0,
                      "subCategoryID": 0,
                      "currency": 0,
                      "price": 0,
                      "salePercent": 0, //ignor
                      "salePrice": 0, //ignor
                      "country": 0,
                      "region": 0,
                      "city": 0,
                      "state": 0,
                      "description": "string",
                      "name": "string", //auto generated and editable
                      "locationLatitude": 0,
                      "locationLongitude": 0,
                      "contact": "string",
                      "aim": 0,
                      "owner": 0,
                      "comment": "string", //ignor
                      "view": 0, //ignor
                      "tags": "string",
                      "imagesList": ["string"],
                      "space": 0,
                      "constructionType": 0,
                      "paymentTime": 0,
                      "rooms": 0,
                      "floor": 0] as [String : Any]
    var owner = ["Individual", "Agency", "Diller"]
    var currency = ["֏", "₽", "$"]
    var type = ["ForSale", "ForRent", "Exchange", "Buy", "Search"]
    var state = ["Normal", "Urgent", "VIP"]
    var productState = ["New", "Used"]
    var floors = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20+"]
    var rooms = ["1", "2", "3", "4", "5", "6", "7", "8+"]
    var constructionType = ["Stone", "Panels", "Monolith", "Bricks", "Cassette", "Wooden"]
    var cityIdArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadImageCollectionView.delegate = self
        uploadImageCollectionView.dataSource = self
        descriptionView.layer.borderColor = #colorLiteral(red: 0.9053820968, green: 0.900000155, blue: 0.9095192552, alpha: 1)
        descriptionView.layer.borderWidth = 1
        descriptionView.layer.cornerRadius = 5
        locationOnMapButton.roundedButton()
        hideKeyboardWhenTappedAround()
        
        spaceView.isHidden = true
        floorRoomsConsTypeView.isHidden = true
        uploadImageCollectionView.delegate = self
        uploadImageCollectionView.dataSource = self
        
        setupDropDown()
        let type = ["ForSale", "ForRent", "Exchange", "Buy", "Search"]
        aimDropDown.optionArray = type
        aimDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Type: \(selected) \n index: \(index)")
            self.realEstate.updateValue(index, forKey: "aim")
        })
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func setupDropDown() {
        
        ownerDropDown.optionArray = owner
        ownerDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Owner: \(selected) \n index: \(index)")
            self.realEstate.updateValue(index, forKey: "owner")
        })
        
        currencyDropDown.optionArray = currency
        currencyDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Currency: \(selected) \n index: \(index)")
            self.realEstate.updateValue(index, forKey: "currency")
        })
        
        countryDropDown.didSelect{(selectedText , index ,id) in
            print("Selected Country: \(selectedText) \n index: \(index)")
            self.realEstate.updateValue(index + 1, forKey: "country")
            self.regionDropDown.optionArray = [""]
            self.regionDropDown.text = ""
            LocationRequestManager.getRegion(culture: "EN", countryID: index + 1) { [weak self] loadedRegion in
                self?.regionDropDown.optionArray = self?.getRegions(loadedRegion: loadedRegion ?? []) ?? [""]
            }
        }
        
        regionDropDown.didSelect{(selectedText ,index ,id) in
            print("Selected Region: \(selectedText) \n index: \(index)")
            self.realEstate.updateValue(index + 1, forKey: "region")
            self.city_districtDropDown.optionArray = [""]
            self.city_districtDropDown.text = ""
            LocationRequestManager.getCity(culture: "EN", regionID: index + 1) { [weak self] loadedCity in
                self?.city_districtDropDown.optionArray = self?.getCities(loadedCity: loadedCity ?? []) ?? [""]
                self?.cityIdArray = self?.getCityIds(loadedCity: loadedCity ?? []) ?? []
            }
            
        }
        
        city_districtDropDown.didSelect(completion: { (selectedText, index, id)  in
            print("Selected City: \(selectedText) \n index: \(index)")
            self.realEstate.updateValue(self.cityIdArray[index], forKey: "city")
        })
        
        aimDropDown.optionArray = type
        aimDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Type: \(selected) \n index: \(index)")
            self.realEstate.updateValue(index, forKey: "aim")
        })
        
        productStateDropDown.optionArray = productState
        productStateDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected payment: \(selected) \n index: \(index)")
            self.realEstate.updateValue(index, forKey: "paymentTime")
        })
        
        floorDropDown.optionArray = floors
        floorDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected floor: \(selected) \n index: \(index)")
            self.realEstate.updateValue(index + 1, forKey: "floor")
        })
        
        roomsDropDown.optionArray = rooms
        roomsDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected rooms: \(selected) \n index: \(index)")
            self.realEstate.updateValue(index + 1, forKey: "rooms")
        })
        
        constructionTypeDropDown.optionArray = constructionType
        constructionTypeDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Construction type: \(selected) \n index: \(index)")
            self.realEstate.updateValue(index, forKey: "constructionType")
        })
    }
    func getCountries(loadedCountry: Country) ->[String] {
        var countryArray = [String]()
        for i in 0 ..< loadedCountry.count {
            countryArray.append(loadedCountry[i].country)
        }
        return countryArray
    }
    func getRegions(loadedRegion: Region) ->[String] {
        var regionArray = [String]()
        for i in 0 ..< loadedRegion.count {
            regionArray.append(loadedRegion[i].country)
        }
        return regionArray
    }
    func getCities(loadedCity: City) ->[String] {
        var cityArray = [String]()
        for i in 0 ..< loadedCity.count {
            cityArray.append(loadedCity[i].country)
        }
        return cityArray
    }
    func getCityIds(loadedCity: City) ->[Int] {
        var cityIds = [Int]()
        for i in 0 ..< loadedCity.count {
            cityIds.append(loadedCity[i].id)
        }
        return cityIds
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height / 2 + 10
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
extension AddRealEstateVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return uploadedImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plusButtonCollectionViewCell", for: indexPath) as! UploadImageCollectionViewCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "uploadedCollectionViewCell", for: indexPath) as! UploadImageCollectionViewCell
            cell.uploadedImageVidew.image = uploadedImagesArray[indexPath.row]
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let alert = UIAlertController(title: "Choose image source", message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                openImagePicker(with: .camera)
            }))
            alert.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: { _ in
                openImagePicker(with: .photoLibrary)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true)
            func openImagePicker(with source: UIImagePickerController.SourceType) {
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = source
                present(picker, animated: true)
            }
        }
    }
}

extension AddRealEstateVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate { /// Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            uploadedImagesArray.append(image)
            uploadImageCollectionView.reloadData()
            print("Arraycount: ", uploadedImagesArray.count)
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
