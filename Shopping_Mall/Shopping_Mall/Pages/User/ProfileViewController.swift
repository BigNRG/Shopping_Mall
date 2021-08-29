//
//  ProfileViewController.swift
//  Shopping_Mall
//
//  Created by Harut on 05.07.21.
//

import UIKit

class ProfileViewController: UIViewController,Storyborded {
    
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userEmailLable: UILabel!
    @IBOutlet weak var BallanceLabel: UILabel!
    @IBOutlet weak var userFrstNameTextField: UITextField!
    @IBOutlet weak var userLastNametextField: UITextField!
    @IBOutlet weak var userStreetTextFiield: UITextField!
    @IBOutlet weak var userCityTextField: UITextField!
    @IBOutlet weak var userAddresTextFiield: UITextField!
    @IBOutlet weak var userPhoneNumberTextFiield: UITextField!
    @IBOutlet weak var editButton: UIButton!
    
    private var updateMode = false
    
    private var id: Int?
    private var phoneNumber: String?
    private var firstName: String?
    private var lastName: String?
    private var email: String?
    private var state: Int?
    private var country: Int?
    private var region: Int?
    private var city: Int?
    private var address: String?
    private var rating: Double?
    private var balance: Int?
    private var avatar: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserProfile()
        imgView()
        changePageMode(edit: true)
    }
    
    
    @IBAction func editUserProfaile(_ sender: UIButton) {
        if updateMode {
            changePageMode(edit: false)
        } else {
            getTextFieldTexts()
            profileUserEdit()
            changePageMode(edit: true)
        }
    }
    
    private func changePageMode(edit: Bool) {
        updateMode = edit
        
        if updateMode {
            editButton.setTitle("Edit", for: .normal)
            userFrstNameTextField.isEnabled = false
            userLastNametextField.isEnabled = false
            userStreetTextFiield.isEnabled = false
            userCityTextField.isEnabled = false
            userAddresTextFiield.isEnabled = false
            userPhoneNumberTextFiield.isEnabled = false
        } else {
            editButton.setTitle("Save", for: .normal)
            userFrstNameTextField.isEnabled = true
            userLastNametextField.isEnabled = true
        }
    }
    
    private func getUserProfile(){
        UserProfileDataManeger.getUserProfile() {[weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let user):
                DispatchQueue.main.async {
                    self.handleUserData(user)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func getTextFieldTexts(){
        firstName = userFrstNameTextField.text
        lastName = userLastNametextField.text
        address = userAddresTextFiield.text
    }
    
    private func handleUserData(_ user: UserProfileDataModel) {
        
        id = user.id
        phoneNumber = user.phoneNumber
        firstName = user.firstName
        lastName = user.lastName
        email = user.email
        state = user.state
        country = user.country
        region = user.region
        city = user.city
        address = user.address
        rating = user.rating
        balance = user.balance
        avatar = user.avatar
        
        userEmailLable.text = email
        userFrstNameTextField.text = firstName
        userLastNametextField.text = lastName
        userStreetTextFiield.text = String(state ?? 0)
        userCityTextField.text = String(city ?? 0)
        userAddresTextFiield.text = address
        userPhoneNumberTextFiield.text = phoneNumber
    }
    
    private func profileUserEdit() {
        UserProfileDataManeger.editUserProfile(id: id, phoneNumber: phoneNumber, firstName: firstName, lastName: lastName, email: email, state: state, country: country, region: region, city: city, address: address, rating: rating, balance: balance, avatar: avatar) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success:
                DispatchQueue.main.async {
                    self.changePageMode(edit: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func imgView(){
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.clipsToBounds = true
    }
    
}

