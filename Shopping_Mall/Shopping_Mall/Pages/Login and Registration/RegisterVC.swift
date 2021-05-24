//
//  RegisterVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/17/21.
//

import UIKit

class RegisterVC: UIViewController, UIPickerViewDataSource {
   
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var firsNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let countries = ["Armenia", "Russia", "USA", "China"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.pickerView.dataSource = self
        self.pickerView.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func registerBtn(_ sender: UIButton) {
        let phoneNumber = phoneNumberTF.text ?? ""
        let firsName = firsNameTF.text ?? ""
        let email = emailTF.text ?? ""
        let password = passwordTF.text ?? ""

        UserRequestManager.createUser(phoneNumber: phoneNumber, firstName: firsName, email: email, password: password, country: 1)
    }
}
extension RegisterVC: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }


    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    

}
