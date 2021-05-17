//
//  RequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/10/21.
//

import Foundation
import UIKit

final class RequestManager: NSObject {
    private static let BASE_URL = "http://tradelist3-001-site1.itempurl.com/api/"
    private static let AUTHENTICATE_URL = "Identity/AuthenticateClientApp"
    private static let REGISTER_URL = "User/CreateUser"
    private static let CATEGORY_URL = "Categories/MainCategories"
    private static let SUBCATEGORY_URL = "Categories/SubCategories"
    private static let MAIN_PAGE_URL = "General/MainPage"
    private static let GET_SALE_URL = "Ad/GetSale"

    private static let LOGIN_URL = "Identity/Login"
    private static let CREATEUSER_URL = "User/CreateUser"
    private static let SENDCONFIRMEMAIL_URL = "User/SendConfirmEmail"
    
    private static let CONTENT_TYPE = "application/json"
    private static let HTTP_METHOD = "POST"
    private static let TOKEN_USER_ID = "MyMobileListTrade"
    private static let TOKEN_USER_SECRET = "+*z16e3#_yhq112y_j#018z(dzyn5+vw(e@sofeiq5rh__u+6="
    
    private static let TEMP_TOKEN = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MzcxMDI3MjQsImlzcyI6Imh0dHA6Ly90cmFkZWxpc3QyLTAwMS1zaXRlMS5pdGVtcHVybC5jb20vIiwiYXVkIjoiTGlzdFRyYWRlIn0.L7-rCwyPoJePWknAThceJwxF16Dh7RMFi3_4hTlY_eI"
    //    private static var token = ""
    
    // MARK: - Get Token
    static func getToken(){
        // Prepare URL
        guard let requestUrl = URL(string: BASE_URL + AUTHENTICATE_URL) else { fatalError() }
        print("RequestURL: ",requestUrl)
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = HTTP_METHOD
        
        // Set HTTP Request Headers
        request.addValue(CONTENT_TYPE, forHTTPHeaderField: "Content-Type")
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
                print(jsonErr)
            }
        }
        task.resume()
    }
    
    // MARK: - Login
    static func login(userName: String, password: String, token: String, completion: @escaping (UserModel?) -> Void){
        guard  let url = URL(string: BASE_URL + LOGIN_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(TEMP_TOKEN, forHTTPHeaderField: "Authorization")
        let parameters = ["userName": userName, "password": password, "token": "token"] as [String : Any]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print(resp.statusCode)
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
    
    // MARK: - Register
    static func register(phoneNumber: String, firstName: String, email: String, password: String,
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
                print(resp.statusCode)
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
                print(resp.statusCode)
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
    
    // MARK: - Get MainCategories
    static func loadMainCategories(completion: @escaping ([MainCategory]?) -> Void) {
        
        guard  let url = URL(string: BASE_URL + "Categories/MainCategories") else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "GET"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(TEMP_TOKEN, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print(resp.statusCode)
                let decodedData = try? JSONDecoder().decode(MainCategories.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print(result[0].category)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    
    // MARK: - Get SubCategories
    static func loadSubCategories(id: Int, selectedCategoryName: String, completion: @escaping (SubCategories?) -> Void) {
        
        guard  let url = URL(string: BASE_URL + SUBCATEGORY_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(TEMP_TOKEN, forHTTPHeaderField: "Authorization")
        
        let parameters = ["value": id] as [String : Int]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print(resp.statusCode)
                let decodedData = try? JSONDecoder().decode(SubCategories.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print(result[0].type)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    
    // MARK: - Get MainPage
    static func loadMainPage() {
        guard  let url = URL(string: BASE_URL + MAIN_PAGE_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "GET"
        
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("countryID", forHTTPHeaderField: "1")
        request.addValue("currency", forHTTPHeaderField: "1")
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(TEMP_TOKEN, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print(resp.statusCode)
                let decodedData = try? JSONDecoder().decode(MainPage.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        print(result.adsWithCategories[0].category.name)
                    }
                } else {DispatchQueue.main.async {
                }
                
                }
            }
        }.resume()
    }
    
    // MARK: - Get Sale
    
    static func loadSales(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (GetSale?) -> Void) {
        guard let url = URL(string: BASE_URL + GET_SALE_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(TEMP_TOKEN, forHTTPHeaderField: "Authorization")
        let parameters = ["id": nil,
                          "pageNumber": pageNumber,
                          "adCount": adCount,
                          "subCategoryID": subCategoryID,
                          "region": nil,
                          "city": nil,
                          "onlyWithPhotos": false,
                          "aim": nil,
                          "adOwner": nil,
                          "currency": nil,
                          "priceFrom": nil,
                          "priceTo": nil,
                          "productState": nil,
                          "countryID": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print(resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetSale.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print(result[0].id)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    static func loadSalesSingle(id: Int, completion: @escaping (GetSale?) -> Void) {
        guard let url = URL(string: BASE_URL + GET_SALE_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(TEMP_TOKEN, forHTTPHeaderField: "Authorization")
        let parameters = ["id": id,
                          "pageNumber": nil,
                          "adCount": nil,
                          "subCategoryID": nil,
                          "region": nil,
                          "city": nil,
                          "onlyWithPhotos": false,
                          "aim": nil,
                          "adOwner": nil,
                          "currency": nil,
                          "priceFrom": nil,
                          "priceTo": nil,
                          "productState": nil,
                          "countryID": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print(resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetSale.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print(result[0].id)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
}
