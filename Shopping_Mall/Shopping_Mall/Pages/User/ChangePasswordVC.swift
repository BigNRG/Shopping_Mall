//
//  ChangePasswordVC.swift
//  Shopping_Mall
//
//  Created by Harut on 05.07.21.
//

import UIKit

class ChangePasswordVC: UIViewController,Storyborded {
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var oldPasswordtextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberTextField.delegate = self
        oldPasswordtextField.delegate = self
        newPasswordTextField.delegate = self
    }
    
    
    private func checkValidation(){
        if phoneNumberTextField.text!.isEmpty {
            let ac = UIAlertController(title: "", message: "heraxos@ chka ", preferredStyle: .alert)
            present(ac, animated: true, completion: nil)
            return
        }
        if oldPasswordtextField.text!.isEmpty{
            let ac = UIAlertController(title: "", message: "sxal hin parol ", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            ac.addAction(ok)
            present(ac, animated: true, completion: nil)
            return
        }
        let password = newPasswordTextField.text ?? ""
        
        if password.isValidPassword(){
            chPass()
        }else{
            let ac = UIAlertController(title: "", message: "minim sinvlov 8", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
            ac.addAction(ok)
            present(ac, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func saveChange(_ sender: UIButton) {
        checkValidation()
    }
    
    func chPass(){
        let model = ChangePassword.init(phoneNumber: phoneNumberTextField.text!, oldPassword: oldPasswordtextField.text!, newPassword: newPasswordTextField.text!)
        
        ChangePasswordManager.changePasswordUserProfile(password: model) { [weak self] result in
            switch result{
            case .success:
                DispatchQueue.main.async {
                    self?.showAlert()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func showAlert(){
        let ac = UIAlertController(title: nil, message: "Your password has been changed", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        ac.addAction(ok)
        ac.navigationController?.becomeFirstResponder()
        present(ac, animated: true, completion: nil)
    }
}

extension ChangePasswordVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let text = (textField.text ?? "") + string
        let res: String
        
        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            res = String(text[text.startIndex..<end])
        } else {
            res = text
        }
        
        textField.text = res
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case phoneNumberTextField:
            oldPasswordtextField.becomeFirstResponder()
        case oldPasswordtextField:
            newPasswordTextField.becomeFirstResponder()
        case newPasswordTextField:
            newPasswordTextField.resignFirstResponder()
            checkValidation()
        default:
            break
        }
        
        return true
    }
}

extension String {
    func isValidPassword() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,}$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
