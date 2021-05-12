//
//  HomeVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/10/21.
//

import UIKit

class HomeVC: UIViewController, ObservableObject {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavigationBar()
        loginButton.roundedButton()
        hideKeyboardWhenTappedAround()
        if !NetworkManager.monitorNetwork() {
            loginButton.isEnabled = false
        }
        else {
            //            RequestManager.getToken()
            //            guard let savedToken = UserDefaults.standard.string(forKey: "savedToken") else {return}
        }
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        let username = userNameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let token = UserDefaults.standard.string(forKey: "TOKEN") ?? "no token"
        RequestManager.login(username: username, password: password, token: token)        
    }
}


