//
//  AdGetRequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/24/21.
//

import Foundation
import UIKit

final class AdRequestManager: NSObject {
    
    private static let GET_SALE_URL = "Ad/GetSale"
    
    // MARK: - Get Sale
    static func loadSales(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (GetSale?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_SALE_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
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
                print("Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetSale.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print("111", result[1].id)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    static func loadSingleSale(id: Int, completion: @escaping (GetSale?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_SALE_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
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
                print("Response Status code: ",resp.statusCode)
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

