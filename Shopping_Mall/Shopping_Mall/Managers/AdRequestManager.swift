//
//  AdRequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit
final class AdRequestManager: NSObject {
    
    private static let ADD_RealEstate_URL = "Ad/RealEstate"
    private static let ADD_Appliance_URL = "Ad/Appliance"
    private static let ADD_HouseholdGoods_URL = "Ad/HouseholdGoods"
    private static let ADD_ClothesAndShoes_URL = "Ad/ClothesAndShoes"
    private static let ADD_ForChildren_URL = "Ad/ForChildren"
    private static let ADD_JewerlyAndAccessories_URL = "Ad/JewerlyAndAccessories"
    private static let ADD_Construction_URL = "Ad/Construction"
    private static let ADD_AllForHomeAndGarden_URL = "Ad/AllForHomeAndGarden"
    private static let ADD_Electronics_URL = "Ad/Electronics"
    private static let ADD_ProductsAndDrinks_URL = "Ad/ProductsAndDrinks"
    private static let ADD_Furniture_URL = "Ad/Furniture"
    private static let ADD_PetsAndPlants_URL = "Ad/PetsAndPlants"
    private static let ADD_Culture_URL = "Ad/Culture"
    private static let ADD_Work_URL = "Ad/Work"
    private static let ADD_Services_URL = "Ad/Services"
    private static let ADD_Acquaintance_URL = "Ad/Acquaintance"
    private static let ADD_HealfCare_URL = "Ad/HealfCare"
    private static let ADD_RSport_URL = "Ad/Sport"
    private static let ADD_Tourism_URL = "Ad/Tourism"
    private static let ADD_CigaretteAndAlcohol_URL = "Ad/CigaretteAndAlcohol"
    private static let ADD_EverythingElse_URL = "Ad/EverythingElse"
    private static let ADD_Vehicle_URL = "Ad/Vehicle"
    private static let ADD_Exchange_URL = "Ad/Exchange"

    // MARK: - Add RealEstate
    static func addRealEstate(realEstateDict: [String : Any], culture: String, completion: @escaping (RealEstateElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + ADD_RealEstate_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: culture)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        let parameters = [ "id": realEstateDict["subCategoryID"],
                           "userID": realEstateDict["userID"],
                           "subCategoryID": realEstateDict["subCategoryID"],
                           "currency": realEstateDict["currency"],
                           "price": realEstateDict["price"],
                           "salePercent": realEstateDict["salePercent"],
                           "salePrice": realEstateDict["salePrice"],
                           "country": realEstateDict["country"],
                           "region": realEstateDict["region"],
                           "city": realEstateDict["city"],
                           "state": realEstateDict["state"],
                           "description": realEstateDict["description"],
                           "name": realEstateDict["name"],
                           "locationLatitude": realEstateDict["locationLatitude"],
                           "locationLongitude": realEstateDict["locationLongitude"],
                           "contact": realEstateDict["contact"],
                           "aim": realEstateDict["aim"],
                           "owner": realEstateDict["owner"],
                           "comment": realEstateDict["comment"],
                           "view": realEstateDict["view"],
                           "tags": realEstateDict["tags"],
                           "imagesList": realEstateDict["imagesList"],
                           "space": realEstateDict["space"],
                           "constructionType": realEstateDict["constructionType"],
                           "paymentTime": realEstateDict["paymentTime"],
                           "rooms": realEstateDict["rooms"],
                           "floor": realEstateDict["floor"]] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Add Real Estate Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(RealEstateElements.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
}
