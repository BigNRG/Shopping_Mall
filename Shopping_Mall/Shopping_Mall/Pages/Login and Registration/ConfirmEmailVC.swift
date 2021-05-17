//
//  ConfirmEmailVC.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/17/21.
//

import UIKit

class ConfirmEmailVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendConfirmEmailBtn(_ sender: UIButton) {
        
        let email = emailTF.text ?? ""
       
        let alertController = UIAlertController(title: "ՈւՇԱԴՐՈւԹՅՈւՆ", message: "Լրացնել էլ. փոստին ուղարկված կոդը", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField) -> Void in
                    textField.placeholder = "Email Code"
                }
        
        let cancelAction = UIAlertAction(title: "Չեղարկել", style: UIAlertAction.Style.cancel) { (result : UIAlertAction) -> Void in
                    print("Չեղարկել")
                }

        alertController.addAction(cancelAction)
        alertController.addAction(UIAlertAction(title: "Հաստատել", style: .default, handler: { [weak self] (_) in
            let textField = alertController.textFields![0]
            print("Text field: \(String(describing: textField.text))")
            RequestManager.sendConfirmEmail(email: email, token: textField.text!)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
   

}
