//
//  GeneralRequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

final class GeneralRequestManager: NSObject {
    private static let MAIN_PAGE_URL = "General/MainPage"
    
    // MARK: - Get MainPage
    static func loadMainPage(completion: @escaping (MainPage?) -> Void) {
        guard let requestUrl = URL(string: RequestManager.baseURL + MAIN_PAGE_URL) else {return}
        var request=URLRequest(url:requestUrl)
        print("RequestURL: ",requestUrl)
        request.httpMethod = "GET"
        
        request.addValue("countryID", forHTTPHeaderField: "1")
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("currency", forHTTPHeaderField: "1")
        
        request.addValue(RequestManager.contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Main Page Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(MainPage.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print("MainPageCategory: ", result.adsWithCategories[0].category.name)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    
}
