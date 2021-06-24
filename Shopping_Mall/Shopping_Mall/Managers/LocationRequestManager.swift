//
//  LocationRequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

final class LocationRequestManager: NSObject {
    private static let GET_COUNTRY_URL = "Location/Country"
    private static let GET_REGION_URL = "Location/Region"
    private static let GET_CITY_URL = "Location/City"

    // MARK: - Get Country
    static func getCountry(culture: String, completion: @escaping (Country?) -> Void) {
        guard let requestUrl = URL(string: RequestManager.baseURL + GET_COUNTRY_URL) else {return}
        var request=URLRequest(url:requestUrl)
        print("GetCountry RequestURL: ",requestUrl)
        request.httpMethod = RequestManager.httpMethod
        
        request.addValue(culture, forHTTPHeaderField: "culture")
        request.addValue(RequestManager.contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Get Country response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(Country.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print("Country Count", result.count)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    // MARK: - Get Region
    static func getRegion(culture: String, countryID: Int, completion: @escaping (Region?) -> Void) {
        guard let requestUrl = URL(string: RequestManager.baseURL + GET_REGION_URL) else {return}
        var request=URLRequest(url:requestUrl)
        print("GetRegion RequestURL: ",requestUrl)
        request.httpMethod = RequestManager.httpMethod
        request.addValue(culture, forHTTPHeaderField: "culture")
        request.addValue(RequestManager.contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        let parameters = ["id": countryID] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Get Region response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(Region.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print("Region Count", result.count)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    // MARK: - Get City
    static func getCity(culture: String, regionID: Int, completion: @escaping (City?) -> Void) {
        guard let requestUrl = URL(string: RequestManager.baseURL + GET_CITY_URL) else {return}
        var request=URLRequest(url:requestUrl)
        print("GetCity RequestURL: ",requestUrl)
        request.httpMethod = RequestManager.httpMethod
        request.addValue(culture, forHTTPHeaderField: "culture")
        request.addValue(RequestManager.contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        let parameters = ["id": regionID] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Get City response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(City.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print("City Count", result.count)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
}
