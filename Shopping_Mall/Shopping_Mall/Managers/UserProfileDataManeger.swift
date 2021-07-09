//
//  UserProfileDataManeger.swift
//  Shopping_Mall
//
//  Created by Harut on 03.07.21.
//

import UIKit
import Network

class UserProfileDataManeger: NSObject {
    
    private static let userData_Url = "User/Data"
    private static let userGetData_Url = "User"
    
    class func getUserProfile(completion: @escaping(Result<UserProfileDataModel,Error>) -> Void){
        let userId = UserDefaults.standard.integer(forKey: "userId")
        var urlComponent = URLComponents.init(string: RequestManager.baseURL + userGetData_Url)
        urlComponent?.queryItems = [ URLQueryItem.init(name: "userID", value:String(userId) )]
        var request = URLRequest.init(url: (urlComponent?.url!)!)
        
        request.httpMethod = "Get"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        
        
        URLSession.shared.dataTask(with: request){data, response, error in
            if error != nil{
                completion(.failure(error!))
            }
            if let data = data{
                let stringRepresentation = String(data: data, encoding: .utf8)
                print(stringRepresentation as Any)
                let decoder = JSONDecoder()
                if let user = try? decoder.decode(UserProfileDataModel.self, from: data){
                    completion(.success(user))
                    
                    print("khkhkjhkhjk")
                }else{
                    print("Unable to parse JSON")
                }
            }
        }.resume()
    }
    
    class func editUserProfile(id: Int?, phoneNumber: String?, firstName: String?, lastName: String?, email: String?, state: Int?, country: Int?, region: Int?, city: Int?, address: String?, rating: Double?, balance: Int?, avatar: String?, completion: @escaping(Result<UserProfileDataModel,Error>) -> Void) {
        
        let userId = UserDefaults.standard.integer(forKey: "userId")
        let user = UserProfileDataModel(id: userId, phoneNumber: phoneNumber, firstName: firstName, lastName: lastName, email: email, state: state, country: country, region: region, city: city, address: address, rating: rating, balance: balance, avatar: avatar)
        
        let url = URL(string: RequestManager.baseURL + userData_Url)!
        let encoder = JSONEncoder()
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        request.httpBody = try? encoder.encode(user)
        
        URLSession.shared.dataTask(with: request){data, response, error in
            if error != nil{
                completion(.failure(error!))
            }
            if let data = data{
                let stringRepresentation = String(data: data, encoding: .utf8)
                print(stringRepresentation as Any)
                let decoder = JSONDecoder()
                if let user = try? decoder.decode(UserProfileDataModel.self, from: data){
                    completion(.success(user))
                    print("khkhkjhkhjk")
                }else{
                    print("Unable to parse JSON")
                }
            }
        }.resume()
    }
}
