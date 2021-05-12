//
//  RequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/10/21.
//

import Foundation
import UIKit

final class RequestManager: NSObject {
    private static let baseUrl = "http://tradelist3-001-site1.itempurl.com/api/"
    private static let authenticateUrl = "Identity/AuthenticateClientApp"
    private static let loginUrl = "Identity/Login"
    private static let content_type = "application/json"
    private static let http_method = "POST"
    private static let userID = "MyMobileListTrade"
    private static let userSecret = "+*z16e3#_yhq112y_j#018z(dzyn5+vw(e@sofeiq5rh__u+6="
    //    private static var token = ""
    
    // MARK: - Get Token
    static func getToken(){
        // Prepare URL
        guard let requestUrl = URL(string: baseUrl + authenticateUrl) else { fatalError() }
        print("RequestURL: ",requestUrl)
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = http_method
        
        // Set HTTP Request Headers
        request.addValue(content_type, forHTTPHeaderField: "Content-Type")
        //request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        // Create HTTP Request Body from struct model
        let newUser = UserBody(userID: userID, userSecret: userSecret)
        let jsonData = try! JSONEncoder().encode(newUser)
        
        // Set HTTP Request Body
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else {return}
            do{
                let userToken = try JSONDecoder().decode(TokenModel.self, from: data)
                print("Token: \(userToken.token)")
                UserDefaults.standard.set(userToken.token, forKey: "TOKEN")
                //                token = userToken.token
            }catch let jsonErr{
                print(jsonErr)
            }
        }
        task.resume()
        //        return UserDefaults.standard.object(forKey: "savedToken") as! String
    }
    
    static func login(username: String, password: String, token: String){
        
        guard let requestUrl = URL(string: baseUrl + loginUrl) else { fatalError() }
        print("RequestURL: ",requestUrl)
        var request = URLRequest(url:requestUrl)
        request.httpMethod = "POST"
        let parameters = ["userName": username, "password": password, "token": token] as [String : Any]
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data else {return}
            print("*_*_*_*_*_*", data)
            do{
                let decodedData = try JSONDecoder().decode(UserResponse.self, from: data)
                saveUser(user: decodedData)
                print("User: ", decodedData.firstName)
            }catch let jsonErr{
                print("Error\n", jsonErr)
            }
        }.resume()
    }
    
    static func saveUser(user:UserResponse){
        UserDefaults.standard.set(user.id, forKey: "USER_ID")
        UserDefaults.standard.set(user.phoneNumber, forKey: "USER_PHONENUMBER")
        UserDefaults.standard.set(user.firstName, forKey: "USER_FIRSTNAME")
        UserDefaults.standard.set(user.email, forKey: "USER_EMAIL")
    }
    
}
