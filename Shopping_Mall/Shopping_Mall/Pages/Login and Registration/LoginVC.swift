//  LoginVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/17/21.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        let username = userNameTF.text ?? ""
        let password = passwordTF.text ?? ""

        IdentityRequestManager.login(userName: username, password: password, token: "fbToken") { loginedUser in
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVC_ID") as! TabBarController
////            vc.loadedSales = loginedUser ?? []
//            self.navigationController?.pushViewController(vc, animated: true)
            self.performSegue(withIdentifier: "goToTabBar", sender: nil)

        }
    }
    
   

}
