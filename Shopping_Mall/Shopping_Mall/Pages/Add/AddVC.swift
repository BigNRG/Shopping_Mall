//
//  AddVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 6/3/21.
//


import UIKit
import iOSDropDown

class AddVC: UIViewController {
    // MARK: - Global Outlets
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var scrollInternalView: UIView!
    @IBOutlet weak var mainStackView: UIStackView!
    
    // MARK: - Aim Outlets
    @IBOutlet weak var aimRoundedView: RoundedShadowView!
    @IBOutlet weak var aimLabel: UILabel!
    @IBOutlet weak var aimDropDown: DropDown!
    
    // MARK: - Owner Outlets
    @IBOutlet weak var ownerRoundedView: RoundedShadowView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var ownerDropDown: DropDown!
    
    // MARK: - Location Outlets
    @IBOutlet weak var locationRoundedView: RoundedShadowView!
    @IBOutlet weak var locationStackView: UIStackView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryDropDown: DropDown!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionDropDown: DropDown!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var cityStateDropDown: DropDown!
    @IBOutlet weak var locationOnMapButton: UIButton!
    
    // MARK: - Currency and Price Outlets
    @IBOutlet weak var currencyPriceRoundedView: RoundedShadowView!
    @IBOutlet weak var currencyPriceLabel: UILabel!
    @IBOutlet weak var currencyPriceStackView: UIStackView!
    @IBOutlet weak var currencyDropDown: DropDown!
    @IBOutlet weak var priceTextField: UITextField!
    
    // MARK: - Name and Tags Outlets
    @IBOutlet weak var nameTagsRoundedView: RoundedShadowView!
    @IBOutlet weak var nameTagsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var tagsTextField: UITextField!
    
    // MARK: - Description Outlets
    @IBOutlet weak var descriptionRoundedView: RoundedShadowView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // MARK: - Phone Number Outlets
    @IBOutlet weak var phoneNumberRoundedView: RoundedShadowView!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    // MARK: - Upload Images Outlets
    @IBOutlet weak var uploadImagesRoundedView: RoundedShadowView!
    @IBOutlet weak var uploadImagesLabel: UILabel!
    @IBOutlet weak var uploadImageCollectionView: UICollectionView!
    
    // MARK: - Global Product State
    @IBOutlet weak var globalProductStateRoundedView: RoundedShadowView!
    @IBOutlet weak var globalProductStateLabel: UILabel!
    @IBOutlet weak var globalProductStateDropDown: DropDown!
    
    // MARK: - Additional Outlets
    @IBOutlet weak var additionalStackView: UIStackView!
    
    // MARK: - Additional: Space Outlets
    @IBOutlet weak var spaceView: UIView!
    @IBOutlet weak var spaceRoundedView: RoundedShadowView!
    @IBOutlet weak var spaceStackView: UIStackView!
    @IBOutlet weak var spaceLabel: UILabel!
    @IBOutlet weak var spaceTextField: UITextField!
    
    // MARK: - Additional: Floor, Rooms, Construction Type Outlets
    @IBOutlet weak var floorRoomConsTypeView: UIView!
    @IBOutlet weak var floorRoomConsTypeRoundedView: RoundedShadowView!
    @IBOutlet weak var floorRoomConsTypeStackView: UIStackView!
    @IBOutlet weak var floorStackView: UIStackView!
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var floorDropDown: DropDown!
    @IBOutlet weak var roomsStackView: UIStackView!
    @IBOutlet weak var roomsLabel: UILabel!
    @IBOutlet weak var roomsDropDown: DropDown!
    @IBOutlet weak var constructionTypeStackView: UIStackView!
    @IBOutlet weak var constructionTypeLabel: UILabel!
    @IBOutlet weak var constructionTypeDropDown: DropDown!
    
    // MARK: - Additional: Product State Outlets
    @IBOutlet weak var productStateView: UIView!
    @IBOutlet weak var productStateRoundedView: RoundedShadowView!
    @IBOutlet weak var productStateTransportationStackView: UIStackView!
    @IBOutlet weak var productStateStackView: UIStackView!
    @IBOutlet weak var productStateLabel: UILabel!
    @IBOutlet weak var productStateDropDown: DropDown!
    @IBOutlet weak var transportationStackView: UIStackView!
    @IBOutlet weak var transportationLabel: UILabel!
    @IBOutlet weak var transportationSwitchView: UIView!
    @IBOutlet weak var transportationSwitch: UISwitch!
    
    // MARK: - Additional: Clothes and Shoes Outlets
    @IBOutlet weak var clothingShoesView: UIView!
    @IBOutlet weak var clothingShoesRoundedView: RoundedShadowView!
    @IBOutlet weak var clothingShoesStackView: UIStackView!
    @IBOutlet weak var clothingStackView: UIStackView!
    @IBOutlet weak var clothingSizeLabel: UILabel!
    @IBOutlet weak var clothingSizeTextField: UITextField!
    @IBOutlet weak var shoeStackView: UIStackView!
    @IBOutlet weak var shoeSizeLabel: UILabel!
    @IBOutlet weak var shoeSizeTextField: UITextField!
    
    // MARK: - Additional: Gender and for New Borns Outlets
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var genderRoundedView: RoundedShadowView!
    @IBOutlet weak var genderNewBornStackView: UIStackView!
    @IBOutlet weak var genderStackView: UIStackView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderDropDown: DropDown!
    @IBOutlet weak var newBornStackView: UIStackView!
    @IBOutlet weak var newBornLabel: UILabel!
    @IBOutlet weak var newBornSwitchView: UIView!
    @IBOutlet weak var newBornSwitch: UISwitch!
    
    // MARK: - Additional: Drinks Outlets
    @IBOutlet weak var drinkTypeView: UIView!
    @IBOutlet weak var drinkTypeRoundedView: RoundedShadowView!
    @IBOutlet weak var drinkTypeStackView: UIStackView!
    @IBOutlet weak var drinkIsLocalStackView: UIStackView!
    @IBOutlet weak var drinkIsLocalLabel: UILabel!
    @IBOutlet weak var drinkIsLocalSwitchView: UIView!
    @IBOutlet weak var drinkIsLocalSwitch: UISwitch!
    @IBOutlet weak var drinkIsFrozenStackView: UIStackView!
    @IBOutlet weak var drinkIsFrozenLabel: UILabel!
    @IBOutlet weak var drinkIsFrozenSwitchView: UIView!
    @IBOutlet weak var drinkIsFrozenSwitch: UISwitch!
    @IBOutlet weak var drinkIsNaturalStackView: UIStackView!
    @IBOutlet weak var drinkIsNaturalLabel: UILabel!
    @IBOutlet weak var drinkIsNaturalSwitchView: UIView!
    @IBOutlet weak var drinkIsNaturalSwitch: UISwitch!
    
    // MARK: - Additional: Acquaintance Outlets
    @IBOutlet weak var acquaintanceAimView: UIView!
    @IBOutlet weak var acquaintanceAimRoundedView: RoundedShadowView!
    @IBOutlet weak var acquaintanceAimStackView: UIStackView!
    @IBOutlet weak var acquaintanceAimLabel: UILabel!
    @IBOutlet weak var acquaintanceAimDropDown: DropDown!
    // acquaintanceView
    @IBOutlet weak var acquaintanceView: UIView!
    @IBOutlet weak var acquaintanceRoundedView: RoundedShadowView!
    @IBOutlet weak var acquaintanceStackView: UIStackView!
    @IBOutlet weak var heightStackView: UIStackView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightStackView: UIStackView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var ageStackView: UIStackView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    
    // MARK: - Additional: Tourism Outlets
    @IBOutlet weak var tourismView: UIView!
    @IBOutlet weak var tourismRoundedView: RoundedShadowView!
    @IBOutlet weak var tourismStackView: UIStackView!
    @IBOutlet weak var departureDayStackView: UIStackView!
    @IBOutlet weak var departureDayLabel: UILabel!
    @IBOutlet weak var departureDayTextField: UITextField!
    @IBOutlet weak var returnDayStackView: UIStackView!
    @IBOutlet weak var returnDayLabel: UILabel!
    @IBOutlet weak var returnDayTextField: UITextField!
    //reserved tickets
    @IBOutlet weak var reservedTicketsView: UIView!
    @IBOutlet weak var reservedTicketsRoundedView: RoundedShadowView!
    @IBOutlet weak var reservedTicketsStackView: UIStackView!
    @IBOutlet weak var reservedTicketsLabel: UILabel!
    @IBOutlet weak var reservedTicketsTextField: UITextField!
    
    // MARK: - Additional: Alcohol Outlets
    @IBOutlet weak var alcoholView: UIView!
    @IBOutlet weak var alcoholRoundedView: RoundedShadowView!
    @IBOutlet weak var alcoholStackView: UIStackView!
    @IBOutlet weak var alcoholVolumeStackView: UIStackView!
    @IBOutlet weak var alcoholVolumeLabel: UILabel!
    @IBOutlet weak var alcoholVolumeTextField: UITextField!
    @IBOutlet weak var alcoholIsLocalStackView: UIStackView!
    @IBOutlet weak var alcoholIsLocalLabel: UILabel!
    @IBOutlet weak var alcoholIsLocalSwitchView: UIView!
    @IBOutlet weak var alcoholIsLocalSwitch: UISwitch!

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
    var aim = ["ForSale", "ForRent", "Exchange", "Buy", "Search"]
    var userState = ["Normal", "Urgent", "VIP"]
    var floors = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20+"]
    var rooms = ["1", "2", "3", "4", "5", "6", "7", "8+"]
    var constructionType = ["Stone", "Panels", "Monolith", "Bricks", "Cassette", "Wooden"]
    var productState = ["New", "Used"]
    var acquaintanceAim = ["Friendship", "Marriage", "Entertainment"]
    var gender = ["Man", "Woman"]
    var cityIdArray = [Int]()
    var selectedCagegoryID = 0
    var selectedSubCategoryID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadImageCollectionView.delegate = self
        uploadImageCollectionView.dataSource = self
        descriptionView.layer.borderColor = #colorLiteral(red: 0.9053820968, green: 0.900000155, blue: 0.9095192552, alpha: 1)
        descriptionView.layer.borderWidth = 1
        descriptionView.layer.cornerRadius = 5
        locationOnMapButton.roundedButton()
        hideKeyboardWhenTappedAround()
        setupDropDown()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.navigationItem.title = "Ավելացնել հայտարարություն"
        self.navigationItem.backButtonTitle = ""
        
        LocationRequestManager.getCountry(culture: "EN") { [weak self] loadedCountry in
            self?.countryDropDown.optionArray = self?.getCountries(loadedCountry: loadedCountry ?? []) ?? [""]
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupShowingContent()
    }

    func hideAdditionalViews() {
//        globalProductStateRoundedView.isHidden = false
        additionalStackView.isHidden = true
        spaceView.isHidden = true
        floorRoomConsTypeView.isHidden = true
        productStateView.isHidden = true
        clothingShoesView.isHidden = true
        genderView.isHidden = true
        drinkTypeView.isHidden = true
        acquaintanceAimView.isHidden = true
        acquaintanceView.isHidden = true
        tourismView.isHidden = true
        reservedTicketsView.isHidden = true
        alcoholView.isHidden = true
    }
    
    func setupShowingContent() {
        hideAdditionalViews()
        if selectedCagegoryID == 2 { //real estate
            spaceView.isHidden = false
            additionalStackView.isHidden = false
            floorRoomConsTypeView.isHidden = false
            globalProductStateRoundedView.isHidden = true
        }
        if selectedCagegoryID == 7 { //clothes and shoes
            additionalStackView.isHidden = false
            clothingShoesView.isHidden = false
        }
        if selectedCagegoryID == 8 { //for children
            additionalStackView.isHidden = false
            genderView.isHidden = false
        }
        if selectedCagegoryID == 9 { //jewelery and accesoriesd
            additionalStackView.isHidden = false
            genderView.isHidden = false
            newBornStackView.isHidden = true
        }
        if selectedCagegoryID == 12 { //drinks
            additionalStackView.isHidden = false
            drinkTypeView.isHidden = false
        }
        if selectedCagegoryID == 13 { //Cigarette and alcohol
            additionalStackView.isHidden = false
            alcoholView.isHidden = false
        }
        if selectedCagegoryID == 15 { //tourism
            additionalStackView.isHidden = false
            tourismView.isHidden = false
            reservedTicketsView.isHidden = false
        }
        if selectedCagegoryID == 20 { //services
            additionalStackView.isHidden = false
            globalProductStateRoundedView.isHidden = true
            productStateView.isHidden = false
        }
        if selectedCagegoryID == 22 { //acquaintance
            additionalStackView.isHidden = false
            genderView.isHidden = false
            newBornStackView.isHidden = true
            acquaintanceAimView.isHidden = false
            acquaintanceView.isHidden = false
        }
    }
    
    func setupDropDown() {

        ownerDropDown.optionArray = owner
        ownerDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Owner: \(selected) \n index: \(index)")
//            self.realEstate.updateValue(index, forKey: "owner")
            AddArrayModels.sport.updateValue(index, forKey: "owner")
        })

        currencyDropDown.optionArray = currency
        currencyDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Currency: \(selected) \n index: \(index)")
//            self.realEstate.updateValue(index, forKey: "currency")
            AddArrayModels.sport.updateValue(index, forKey: "currency")
        })

        countryDropDown.didSelect{(selectedText , index ,id) in
            print("Selected Country: \(selectedText) \n index: \(index)")
//            self.realEstate.updateValue(index + 1, forKey: "country")
            AddArrayModels.sport.updateValue(index + 1, forKey: "country")
            self.regionDropDown.optionArray = [""]
            self.regionDropDown.text = ""
            LocationRequestManager.getRegion(culture: "EN", countryID: index + 1) { [weak self] loadedRegion in
                self?.regionDropDown.optionArray = self?.getRegions(loadedRegion: loadedRegion ?? []) ?? [""]
            }
        }

        regionDropDown.didSelect{(selectedText ,index ,id) in
            print("Selected Region: \(selectedText) \n index: \(index)")
//            self.realEstate.updateValue(index + 1, forKey: "region")
            AddArrayModels.sport.updateValue(index + 1, forKey: "region")
            self.cityStateDropDown.optionArray = [""]
            self.cityStateDropDown.text = ""
            LocationRequestManager.getCity(culture: "EN", regionID: index + 1) { [weak self] loadedCity in
                self?.cityStateDropDown.optionArray = self?.getCities(loadedCity: loadedCity ?? []) ?? [""]
                self?.cityIdArray = self?.getCityIds(loadedCity: loadedCity ?? []) ?? []
            }

        }

        cityStateDropDown.didSelect(completion: { (selectedText, index, id)  in
            print("Selected City: \(selectedText) \n index: \(index)")
//            self.realEstate.updateValue(self.cityIdArray[index], forKey: "city")
            AddArrayModels.sport.updateValue(self.cityIdArray[index], forKey: "city")
        })

        aimDropDown.optionArray = aim
        aimDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected aim: \(selected) \n index: \(index)")
//            self.realEstate.updateValue(index, forKey: "aim")
            AddArrayModels.sport.updateValue(index, forKey: "aim")
        })

        floorDropDown.optionArray = floors
        floorDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected floor: \(selected) \n index: \(index)")
//            self.realEstate.updateValue(index + 1, forKey: "floor")
            AddArrayModels.sport.updateValue(index, forKey: "floor")
        })

        roomsDropDown.optionArray = rooms
        roomsDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected rooms: \(selected) \n index: \(index)")
//            self.realEstate.updateValue(index + 1, forKey: "rooms")
            AddArrayModels.sport.updateValue(index, forKey: "rooms")
        })

        constructionTypeDropDown.optionArray = constructionType
        constructionTypeDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Construction type: \(selected) \n index: \(index)")
//            self.realEstate.updateValue(index, forKey: "constructionType")
            AddArrayModels.sport.updateValue(index, forKey: "constructionType")
        })
        
        globalProductStateDropDown.optionArray = productState
        globalProductStateDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Global Product State: \(selected) \n index: \(index)")
//            self.realEstate.updateValue(index, forKey: "constructionType")
            AddArrayModels.sport.updateValue(index, forKey: "productState")
        })
        
        productStateDropDown.optionArray = productState
        productStateDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Product State: \(selected) \n index: \(index)")
            AddArrayModels.sport.updateValue(index, forKey: "productState")
        })
        genderDropDown.optionArray = gender
        genderDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Product State: \(selected) \n index: \(index)")
            self.realEstate.updateValue(index, forKey: "constructionType")
        })
        acquaintanceAimDropDown.optionArray = acquaintanceAim
        acquaintanceAimDropDown.didSelect(completion: { (selected, index, id)  in
            print("Selected Product State: \(selected) \n index: \(index)")
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
    
    @IBAction func addButtonAction(_ sender: Any) {
        
        var base64Images = [String]()
        for i in 0 ..< uploadedImagesArray.count {
            base64Images.append(uploadedImagesArray[i].toBase64(format: .png) ?? "")
        }
        AddArrayModels.sport.updateValue("100001", forKey: "userID") //test user ID
        AddArrayModels.sport.updateValue(0, forKey: "state") //user state
        AddArrayModels.sport.updateValue(selectedSubCategoryID, forKey: "subCategoryID")
        AddArrayModels.sport.updateValue(base64Images, forKey: "imagesList")
        let price = priceTextField.text
        AddArrayModels.sport.updateValue(Int(price ?? "0") ?? 0, forKey: "price")
        AddArrayModels.sport.updateValue(nameTextField.text ?? "", forKey: "name")
        AddArrayModels.sport.updateValue(tagsTextField.text ?? "", forKey: "tags")
        AddArrayModels.sport.updateValue(phoneNumberTextField.text ?? "", forKey: "contact")
        AddArrayModels.sport.updateValue(descriptionTextView.text ?? "", forKey: "description")
        AddArrayModels.sport.updateValue(spaceTextField.text ?? "", forKey: "space")

        realEstate.updateValue(nameTextField.text ?? "", forKey: "name")
        
        AdRequestManager.addSport(sportDict: AddArrayModels.sport)
        
        let alert = UIAlertController(
          title: title,
          message: "Your announcement was succesfully added",
          preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
//            self.dismiss(animated: true, completion: nil)
            self.navigationController?.popToRootViewController(animated: true)

        }
         
        alert.addAction(okAction)

        present(alert, animated: true, completion: nil)
       
    }
    
}
extension AddVC: UICollectionViewDelegate, UICollectionViewDataSource {
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
extension AddVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate { /// Delegate
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
