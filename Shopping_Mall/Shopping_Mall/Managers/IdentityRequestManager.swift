//
//  IdentityRequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

final class IdentityRequestManager: NSObject {
    
    private static let TOKEN_USER_ID = "MyMobileListTrade"
    private static let TOKEN_USER_SECRET = "+*z16e3#_yhq112y_j#018z(dzyn5+vw(e@sofeiq5rh__u+6="
   
    private static let LOGIN_URL = "Identity/Login"
    private static let AUTHENTICATE_URL = "Identity/AuthenticateClientApp"
    
    // MARK: - Get Token
    static func getToken(){
        // Prepare URL
        guard let requestUrl = URL(string: RequestManager.baseURL + AUTHENTICATE_URL) else { fatalError() }
        print("RequestURL: ",requestUrl)
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = RequestManager.httpMethod
        
        // Set HTTP Request Headers
        request.addValue(RequestManager.contentType, forHTTPHeaderField: "Content-Type")
        //request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        // Create HTTP Request Body from struct model
        let newUser = UserBody(userID: TOKEN_USER_ID, userSecret: TOKEN_USER_SECRET)
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
                print("JsonError: ", jsonErr)
            }
        }
        task.resume()
    }
    
    // MARK: - Login
    static func login(userName: String, password: String, token: String, completion: @escaping (UserModel?) -> Void){
        guard  let url = URL(string: RequestManager.baseURL + LOGIN_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        let parameters = ["userName": userName, "password": password, "token": "token"] as [String : Any]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Login Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(UserModel.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print("Name", result.firstName)
                        print("eMail", result.email)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                }
            }
        }.resume()
    }
    
    
    
    
    
    
    
    
}
