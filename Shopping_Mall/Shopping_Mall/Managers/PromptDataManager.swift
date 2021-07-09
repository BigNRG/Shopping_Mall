//
//  PromptDataManager.swift
//  Shopping_Mall
//
//  Created by Harut on 26.06.21.
//

import UIKit
import Foundation
import Network

class PromptDataManager: NSObject {
    
    private static let searchPrompt_Url = "General/Prompt"
    
    class func searchPrompt(prompt: Prompt, completion: @escaping (Result<[Description],Error>) -> Void){
        let url = URL(string: RequestManager.baseURL + PromptDataManager.searchPrompt_Url)!
        let encoder = JSONEncoder()
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.setValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        request.httpBody = try? encoder.encode(prompt)
        
        URLSession.shared.dataTask(with: request){data, response, error in
            if error != nil{
                completion(.failure(error!))
            }
            if let data = data{
                let stringRepresentation = String(data: data, encoding: .utf8)
                print(stringRepresentation as Any)
                let decoder = JSONDecoder()
                if let item = try? decoder.decode(Descriptions.self, from: data){
                    completion(.success(item.descriptions!))
                    
                    print("khkhkjhkhjk")
                }
                
            }
            
        }.resume()
    }
}
