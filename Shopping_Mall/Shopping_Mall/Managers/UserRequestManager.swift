//
//  UserRequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

final class UserRequestManager: NSObject {
    private static let BASE_URL = "http://tradelist3-001-site1.itempurl.com/api/"
    private static let CONTENT_TYPE = "application/json"
    private static let HTTP_METHOD = "POST"
    private static let TOKEN_USER_ID = "MyMobileListTrade"
    private static let TOKEN_USER_SECRET = "+*z16e3#_yhq112y_j#018z(dzyn5+vw(e@sofeiq5rh__u+6="
    private static let TEMP_TOKEN = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MzcxMDI3MjQsImlzcyI6Imh0dHA6Ly90cmFkZWxpc3QyLTAwMS1zaXRlMS5pdGVtcHVybC5jb20vIiwiYXVkIjoiTGlzdFRyYWRlIn0.L7-rCwyPoJePWknAThceJwxF16Dh7RMFi3_4hTlY_eI"
    
    private static let CREATEUSER_URL = "User/CreateUser"
    private static let SENDCONFIRMEMAIL_URL = "User/SendConfirmEmail"
    
    // MARK: - Register
    static func createUser(phoneNumber: String, firstName: String, email: String, password: String,
                           country: Int) {
        guard  let url = URL(string: BASE_URL + CREATEUSER_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(TEMP_TOKEN, forHTTPHeaderField: "Authorization")
        let parameters = ["phoneNumber": phoneNumber, "firstName": firstName, "email": email, "password": password, "country": country] as [String : Any]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(CreateUserModel.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        //                        completion(result)
                        //                        print("numberPhone", result.phoneNumber)
                        //                        print("pass", result.password)
                        print("email", result.email)
                    }
                } else {DispatchQueue.main.async {
                    //                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    // MARK: - Send Confirmation Email
    static func sendConfirmEmail(email: String, token: String) {
        guard  let url = URL(string: BASE_URL + SENDCONFIRMEMAIL_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let parameters = ["email": email, "token": "token"] as [String : Any]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(SendConfirmEmail.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        //                        completion(result)
                        
                        print("email", result.email)
                    }
                } else {DispatchQueue.main.async {
                    //                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
}
