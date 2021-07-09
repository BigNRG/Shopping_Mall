
//
//  ChangePasswordManager.swift
//  Shopping_Mall
//
//  Created by Harut on 07.07.21.
//

import UIKit

class ChangePasswordManager: NSObject {
    
    private static let changePassword_Url = "User/Password"
    
    class func changePasswordUserProfile(password: ChangePassword, completion: @escaping(Result<Bool,Error>) -> Void) {
        
        let url = URL(string: RequestManager.baseURL + changePassword_Url)!
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        
        let parameters = "{\n  \"phoneNumber\": \"\(password.phoneNumber)\",\n  \"oldPassword\": \"\(password.oldPassword)\",\n  \"newPassword\": \"\(password.newPassword)\"\n}"
        let postData = parameters.data(using: .utf8)
        
        request.httpBody = postData
        
        URLSession.shared.dataTask(with: request){data, response, error in
            if error != nil{
                completion(.failure(error!))
            }
            if let data = data{
                let stringRepresentation = String(data: data, encoding: .utf8)
                print(stringRepresentation as Any)
                if let httpResponse = response as? HTTPURLResponse {
                    print("success \(httpResponse.statusCode)")
                    if httpResponse.statusCode == 200 {
                        completion(.success(true))
                    }
                }
            }
            
        }.resume()
    }
}
