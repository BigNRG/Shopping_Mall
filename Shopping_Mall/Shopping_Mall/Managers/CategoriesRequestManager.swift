//
//  CategoriesRequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

final class CategoriesRequestManager: NSObject {
    
    private static let CATEGORY_URL = "Categories/MainCategories"
    private static let SUBCATEGORY_URL = "Categories/SubCategories"
    
    // MARK: - Get MainCategories
    static func loadMainCategories(completion: @escaping ([MainCategory]?) -> Void) {
        
        guard  let url = URL(string: RequestManager.baseURL + "Categories/MainCategories") else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "GET"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load MainCategories Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(MainCategories.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print("Loaded Category Count: ", result.count)
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
        
        guard  let url = URL(string: RequestManager.baseURL + SUBCATEGORY_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        
        let parameters = ["value": id] as [String : Int]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load SubCategories Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(SubCategories.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print("Loaded SubCategory Count: ", result.count)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    
}
