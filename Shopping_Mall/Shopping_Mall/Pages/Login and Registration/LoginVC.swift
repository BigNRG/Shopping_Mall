//  LoginVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/17/21.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        loginButton.roundedButton()
        registerButton.roundedButton()
        hideKeyboardWhenTappedAround()
        if !NetworkManager.monitorNetwork() {
            loginButton.isEnabled = false
            registerButton.isEnabled = false
        }
        else {
            //            RequestManager.getToken()
            //            guard let savedToken = UserDefaults.standard.string(forKey: "savedToken") else {return}
        }
        // Do any additional setup after loading the view.
    }
    func showAlert(tf: UITextField, title: String) {
        if tf.text?.count == 0 {
          let alert = UIAlertController(
            title: title,
            message: "Please fill Username and Password",
            preferredStyle: UIAlertController.Style.alert)
          let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
             
          }
           
          alert.addAction(okAction)
           
          present(alert, animated: true, completion: nil)
        }
      }
    @IBAction func loginButtonAction(_ sender: UIButton) {
        if userNameTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            let alert = UIAlertController(title: "Alert", message: "Please imput your login and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let username = userNameTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            
            IdentityRequestManager.login(userName: username, password: password, token: "fbToken") { loginedUser in
                //            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVC_ID") as! TabBarController
                ////            vc.loadedSales = loginedUser ?? []
                //            self.navigationController?.pushViewController(vc, animated: true)
                UserDefaults.standard.setValue(loginedUser?.id, forKey: "userId")
                self.performSegue(withIdentifier: "goToTabBar", sender: nil)
                print(loginedUser)
            }
            
            
        }
    }
    
    
    
}


extension LoginVC: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == userNameTextField {
      showAlert(tf: userNameTextField, title: "Invalid Username")
      self.passwordTextField.becomeFirstResponder()
    } else {
        showAlert(tf:  passwordTextField, title: "Invalid Password")
      self.passwordTextField.resignFirstResponder()
    }
    return true
  }
   
}
