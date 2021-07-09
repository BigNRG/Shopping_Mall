//
//  SearchDataManager.swift
//  Shopping_Mall
//
//  Created by Harut on 24.06.21.
//

import UIKit
import Foundation

class SearchDataManager: NSObject {
    
    private static let search_Url = "General/Search"
    static let shared = SearchDataManager()
    private override init() {
        
    }
    
    func fatchData(forPrompt: String, completion: @escaping( Result<[RealEstateElement?],Error>)->()){
        guard let url = URL(string: RequestManager.baseURL + SearchDataManager.search_Url) else {return}
        
        var request=URLRequest(url:url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "accept")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        let params = ["strAM" : forPrompt,
                      "strRU" : forPrompt,
                      "strEN" : forPrompt,
                      "CountryID" : 1] as [String : Any]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: [.fragmentsAllowed]) else {fatalError() }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: url){
            data,respons,error in
            print("print respons \(respons)")
            if let err = error {
                completion(.failure(err))
            }
            guard let data = data else { print(error?.localizedDescription ?? "Unknown error")
                return
            }
            let decoder = JSONDecoder()
            if let prod = try? decoder.decode([RealEstateElement].self, from: data){
                completion(.success(prod))
            }else{
                print("Unable to parse JSON")
            }
        }.resume()
    }
    
}
