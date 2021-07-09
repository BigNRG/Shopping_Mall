//
//  UserProfileViewController.swift
//  Shopping_Mall
//
//  Created by Harut on 05.07.21.
//

import UIKit

enum UserSettingsType {
    case profile
    case changePassword
    case wallet
    case myAds
    case settings
    case termsOfService
    case postingRules
    
}
class UserProfileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let userProfailView: [UserSettingsType] = [.profile,.changePassword,.wallet,.myAds,.settings,.termsOfService,.postingRules]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProfailView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        switch userProfailView[indexPath.row] {
        case .profile:
            cell?.textLabel?.text = "Profile"
        case .changePassword:
            cell?.textLabel?.text = "Change Password"
        case .wallet:
            cell?.textLabel?.text = "Wallet"
        case .myAds:
            cell?.textLabel?.text = "My Ads"
        case .settings:
            cell?.textLabel?.text = "Settings"
        case .termsOfService:
            cell?.textLabel?.text = "Terms Of Service"
        case .postingRules:
            cell?.textLabel?.text = "Posting Rules"
        default:
            break
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch userProfailView[indexPath.row] {
        case .profile:
            let vc = ProfileViewController.instance()
            vc.navigationItem.title = "Profile"
            self.show(vc, sender: nil)
        case .changePassword:
            let vc = ChangePasswordVC.instance()
            vc.navigationItem.title = "Change Password"
            self.show(vc, sender: nil)
        case .wallet:
            let vc = WalletVC.instance()
            vc.navigationItem.title = "Wallet"
            self.show(vc, sender: nil)
        case .myAds:
            let vc = MyAdsVC.instance()
            vc.navigationItem.title = "My Ads"
            self.show(vc, sender: nil)
        case .settings:
            let vc = SettingsVC.instance()
            vc.navigationItem.title = "Settings"
            self.show(vc, sender: nil)
        case .termsOfService:
            let vc = TermsOfServiceVC.instance()
            vc.navigationItem.title = "Terms Of Service"
            self.show(vc, sender: nil)
        case .postingRules:
            let vc = PostingRulesVC.instance()
            vc.navigationItem.title = "Posting Rules"
            self.show(vc, sender: nil)
        default:
            break
        }
    }
}
