//
//  AdGetRequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/24/21.
//

import Foundation
import UIKit

final class AdGetRequestManager: NSObject {
    
    private static let GET_SALE_URL = "Ad/GetSale"
    private static let GET_WORK_URL = "Ad/GetWork"
    private static let GET_SPORT_URL = "Ad/GetSport"
    private static let GET_EVERYTHINGELSE_URL = "Ad/GetEverythingElse"
    private static let GET_PETSANDPLANTS_URL = "Ad/GetPetsAndPlants"
    private static let GET_CULTURE_URL = "Ad/GetCulture"
    private static let GET_HEALFCARE_URL = "Ad/GetHealfCare"
    private static let GET_FURNITURE_URL = "Ad/GetFurniture"
    private static let GET_FORHOMEANDGARDEN_URL = "Ad/GetForHomeAndGarden"
    private static let GET_HOUSEHOLDGOODS_URL = "Ad/GetHouseholdGoods"
    private static let GET_CONSTRUCTION_URL = "Ad/GetConstruction"
    private static let GET_ELECTRONICS_URL = "/api/Ad/GetElectronics"
    private static let GET_ACQUAINTANCE_URL = "Ad/GetAcquaintance"
    private static let GET_APPLIANCES_URL = "Ad/GetAppliances"
    private static let GET_CIGARETTEANDALCOHOL_URL = "Ad/GetCigaretteAndAlcohol"
    private static let GET_CLOTHESANDSHOES_URL = "Ad/GetClothesAndShoes"
    private static let GET_FORCHILDREN_URL = "Ad/GetForChildren"
    private static let GET_JEWERLYANDACCESSORIES_URL = "Ad/GetJewerlyAndAccessories"
    private static let GET_PRODUCTSANDDRINKS_URL = "Ad/GetProductsAndDrinks"
    private static let GET_REALESTATE_URL = "Ad/GetRealEstate"
    private static let GET_SERVICES_URL = "Ad/GetServices"
    private static let GET_TOURISMANDREST_URL = "Ad/GetTourismAndRest"
    private static let GET_EXCHANGE_URL = "Ad/GetExchange"
    private static let GET_VEHICLE_URL = "Ad/GetVehicle"
    
    
    
    // MARK: - Get Sale
    static func loadSales(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (GetSaleElements?) -> Void) {
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
                print("Load Sales Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetSaleElements.self, from: data)
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

    
    static func loadSingleSale(id: Int, completion: @escaping (RealEstateElements?) -> Void) {
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
                          ]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single Sales Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(RealEstateElements.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print(result[0].id)
                    }
                } else { DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    
    
    static func loadGetSale(id: Int, completion: @escaping (RealEstateElements?) -> Void) {
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
                print("Load Single Sales Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(RealEstateElements.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print(result[0].id)
                    }
                } else { DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    
    
    
    
    // MARK: - Get Work
    static func loadWork(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (GetWorkElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_WORK_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        let parameters = [ "id": nil,
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
                           "countryID": nil,
                           "adPaymentTime": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Work Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetWorkElements.self, from: data)
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
    static func loadSingleWork(id: Int, completion: @escaping (GetWorkElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_WORK_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        let parameters = [ "id": id,
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
                           "countryID": nil,
                           "adPaymentTime": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single Work Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetWorkElements.self, from: data)
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
    
    
    // MARK: - Get Sport
    static func loadSports(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (GetSportElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_SPORT_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        let parameters = ["id": nil,
                          "pageNumber": pageNumber,
                          "adCount": adCount,
                          "subCategoryID": subCategoryID] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Sports Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetSportElements.self, from: data)
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
    static func loadSingleSport(id: Int, completion: @escaping (GetSportElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_SPORT_URL) else {return}
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
                          "salePriceFrom": nil,
                          "salePriceTo": nil,
                          "salePercentTo": nil,
                          "salePercentFrom": nil,
                          "productState": nil,
                          "countryID": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single Sport Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetSportElements.self, from: data)
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
  
    
    // MARK: - Get EverythingElse
    static func loadEverythingElse(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (GetEverythingElseElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_EVERYTHINGELSE_URL) else {return}
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
                print("Load EverythingElse Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetEverythingElseElements.self, from: data)
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
    static func loadSingleEverythingElse(id: Int, completion: @escaping (GetEverythingElseElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_EVERYTHINGELSE_URL) else {return}
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
                print("Load Single EverythingElse Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetEverythingElseElements.self, from: data)
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
    
    // MARK: - Get PetsAndPlant
    static func loadPetsAndPlant(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (PetsAndPlants?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_PETSANDPLANTS_URL) else {return}
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
                          "countryID": nil
        ] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load PetsAndPlant Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(PetsAndPlants.self, from: data)
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
    static func loadSinglePetsAndPlant(id: Int, completion: @escaping (PetsAndPlants?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_PETSANDPLANTS_URL) else {return}
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
                print("Load Single PetsAndPlant Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(PetsAndPlants.self, from: data)
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
    
    
    // MARK: - Get Culture
    static func loadCulture(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (CultureElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_CULTURE_URL) else {return}
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
                print("Load Culture Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(CultureElements.self, from: data)
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
    static func loadSingleCulture(id: Int, completion: @escaping (CultureElements?) -> Void) {
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
                print("Load Single Culture Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(CultureElements.self, from: data)
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
    
    
    // MARK: - Get HealfCare
    static func loadHealfCare(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (HealfCareElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_HEALFCARE_URL) else {return}
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
                print("Load HealfCare Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(HealfCareElements.self, from: data)
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
    static func loadSingleHealfCare(id: Int, completion: @escaping (HealfCareElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_HEALFCARE_URL) else {return}
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
                print("Load Single HealfCare Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(HealfCareElements.self, from: data)
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
    
    
    // MARK: - Get Furniture
    static func loadFurniture(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (FurnitureElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_FURNITURE_URL) else {return}
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
                print("Load Furniture Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(FurnitureElements.self, from: data)
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
    static func loadSingleFurniture(id: Int, completion: @escaping (FurnitureElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_FURNITURE_URL) else {return}
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
                print("Load Single Furniture Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(FurnitureElements.self, from: data)
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
    
    
    //         MARK: - Get ForHomeAndGarden
    static func loadForHomeAndGarden(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (ForHomeAndGardenElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_FORHOMEANDGARDEN_URL) else {return}
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
                print("Load ForHomeAndGarden Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ForHomeAndGardenElements.self, from: data)
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
    static func loadSingleForHomeAndGarden(id: Int, completion: @escaping (ForHomeAndGardenElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_FORHOMEANDGARDEN_URL) else {return}
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
                print("Load Single ForHomeAndGarden Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ForHomeAndGardenElements.self, from: data)
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
    
    
    // MARK: - Get HouseholdGoods
    static func loadHouseholdGoods(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (HouseholdGoodsElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_HOUSEHOLDGOODS_URL) else {return}
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
                print("Load HouseholdGoods Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(HouseholdGoodsElements.self, from: data)
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
    static func loadSingleHouseholdGoods(id: Int, completion: @escaping (HouseholdGoodsElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_HOUSEHOLDGOODS_URL) else {return}
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
                print("Load Single HouseholdGoods Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(HouseholdGoodsElements.self, from: data)
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
    
    
    // MARK: - Get Construction
    static func loadConstruction(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (ConstructionElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_CONSTRUCTION_URL) else {return}
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
                print("Load Construction Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ConstructionElements.self, from: data)
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
    static func loadSingleConstruction(id: Int, completion: @escaping (ConstructionElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_CONSTRUCTION_URL) else {return}
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
                print("Load Single Construction Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ConstructionElements.self, from: data)
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
    
    
    // MARK: - Get Electronics
    static func loadElectronics(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (GetElectronicsElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_ELECTRONICS_URL) else {return}
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
                print("Load Electronics Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetElectronicsElements.self, from: data)
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
    static func loadSingleElectronics(id: Int, completion: @escaping (GetElectronicsElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_ELECTRONICS_URL) else {return}
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
                print("Load Single Electronics Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(GetElectronicsElements.self, from: data)
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
    
    
    // MARK: - Get Acquaintance
    static func loadAcquaintance(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (AcquaintanceElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_ACQUAINTANCE_URL) else {return}
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
                          "countryID": nil,
                          "gender": false,
                          "acquintanceAim": nil,
                          "height": nil,
                          "weight": nil,
                          "ageFrom": nil,
                          "ageTo": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Acquaintance Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(AcquaintanceElements.self, from: data)
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
    static func loadSingleAcquaintance(id: Int, completion: @escaping (AcquaintanceElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_ACQUAINTANCE_URL) else {return}
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
                          "countryID": nil,
                          "gender": false,
                          "acquintanceAim": nil,
                          "height": nil,
                          "weight": nil,
                          "ageFrom": nil,
                          "ageTo": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single Acquaintance Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(AcquaintanceElements.self, from: data)
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
    
    // MARK: - Get Appliances
    static func loadAppliances(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (AppliancesElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_APPLIANCES_URL) else {return}
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
                print("Load Appliances Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(AppliancesElements.self, from: data)
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
    static func loadSingleAppliances(id: Int, completion: @escaping (AppliancesElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_APPLIANCES_URL) else {return}
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
                print("Load Single Appliances Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(AppliancesElements.self, from: data)
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
    
    
    // MARK: - Get CigaretteAndAlcohol
    static func loadCigaretteAndAlcohol(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (CigaretteAndAlcoholElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_CIGARETTEANDALCOHOL_URL) else {return}
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
                          "countryID": nil,
                          "isLocal": false,
                          "alcoholVolume": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load CigaretteAndAlcohol Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(CigaretteAndAlcoholElements.self, from: data)
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
    static func loadSingleCigaretteAndAlcohol(id: Int, completion: @escaping (CigaretteAndAlcoholElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_CIGARETTEANDALCOHOL_URL) else {return}
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
                          "countryID": nil,
                          "isLocal": false,
                          "alcoholVolume": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single CigaretteAndAlcohol Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(CigaretteAndAlcoholElements.self, from: data)
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
    
    
    // MARK: - Get ClothesAndShoes
    static func loadClothesAndShoes(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (ClothesAndShoesElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_CLOTHESANDSHOES_URL) else {return}
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
                          "countryID": nil,
                          "clothingSize": nil,
                          "shoesSize": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load ClothesAndShoes Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ClothesAndShoesElements.self, from: data)
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
    static func loadSingleClothesAndShoes(id: Int, completion: @escaping (ClothesAndShoesElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_CLOTHESANDSHOES_URL) else {return}
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
                          "countryID": nil,
                          "clothingSize": nil,
                          "shoesSize": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single ClothesAndShoes Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ClothesAndShoesElements.self, from: data)
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
    
    
    // MARK: - Get ForChildren
    static func loadForChildren(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (ForChildrenElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_FORCHILDREN_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        let parameters = ["id": nil,
                          "pageNumber": 1,
                          "adCount": 1,
                          "subCategoryID": 1,
                          "region": nil,
                          "city": nil,
                          "onlyWithPhotos": false,
                          "aim": nil,
                          "adOwner": nil,
                          "currency": nil,
                          "priceFrom": nil,
                          "priceTo": nil,
                          "productState": nil,
                          "countryID": nil,
                          "gender": false,
                          "forNewBorns": false] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load ForChildren Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ForChildrenElements.self, from: data)
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
    static func loadSingleForChildren(id: Int, completion: @escaping (ForChildrenElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_FORCHILDREN_URL) else {return}
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
                          "countryID": nil,
                          "gender": false,
                          "forNewBorns": false] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single ForChildren Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ForChildrenElements.self, from: data)
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
    
    
    // MARK: - Get JewerlyAndAccessories
    static func loadJewerlyAndAccessories(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (JewerlyAndAccessoriesElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_JEWERLYANDACCESSORIES_URL) else {return}
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
                          "countryID": nil,
                          "gender": false] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load JewerlyAndAccessories Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(JewerlyAndAccessoriesElements.self, from: data)
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
    static func loadSingleJewerlyAndAccessories(id: Int, completion: @escaping (JewerlyAndAccessoriesElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_JEWERLYANDACCESSORIES_URL) else {return}
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
                          "countryID": nil,
                          "gender": false] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single JewerlyAndAccessories Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(JewerlyAndAccessoriesElements.self, from: data)
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
    
    
    // MARK: - Get ProductsAndDrinks
    static func loadProductsAndDrinks(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (ProductsAndDrinksElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_PRODUCTSANDDRINKS_URL) else {return}
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
                          "countryID": nil,
                          "isLocal": false,
                          "isFrozen": false,
                          "isNaturalDrink": false] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load ProductsAndDrinks Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ProductsAndDrinksElements.self, from: data)
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
    static func loadSingleProductsAndDrinks(id: Int, completion: @escaping (ProductsAndDrinksElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_PRODUCTSANDDRINKS_URL) else {return}
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
                          "countryID": nil,
                          "isLocal": false,
                          "isFrozen": false,
                          "isNaturalDrink": false] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single ProductsAndDrinks Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ProductsAndDrinksElements.self, from: data)
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
    
    
    // MARK: - Get RealEstate
    static func loadRealEstate(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (RealEstateElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_REALESTATE_URL) else {return}
        var request=URLRequest(url:url)
        request.httpMethod = "POST"
        request.addValue("culture", forHTTPHeaderField: "AM")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(RequestManager.tempToken, forHTTPHeaderField: "Authorization")
        let parameters = ["id": nil,
                          "pageNumber": pageNumber,
                          "adCount": adCount,
                          "subCategoryID": subCategoryID]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load RealEstate Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(RealEstateElements.self, from: data)
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
    static func loadSingleRealEstate(id: Int, completion: @escaping (RealEstateElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_REALESTATE_URL) else {return}
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
                          "countryID": nil,
                          "constructionType": nil,
                          "paymentTime": nil,
                          "rooms": nil,
                          "spaceFrom": nil,
                          "spaceTo": nil,
                          "floorFrom": nil,
                          "floorTo": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single RealEstate Response Status code: PPPPPPPPPPPPPP",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(RealEstateElements.self, from: data)
                if let result = decodedData{
                    DispatchQueue.main.async {
                        completion(result)
                        print(result[0].id)
                        print("Load Single RealEstate Response Status code: +++++++++++++ ",resp.statusCode)

                    }
                } else {DispatchQueue.main.async {
                    completion(nil)
                }
                
                }
            }
        }.resume()
    }
    
    // MARK: - Get Services
    static func loadServices(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (ServicesElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_SERVICES_URL) else {return}
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
                          "countryID": nil,
                          "paymentTime": nil,
                          "transportation": false] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Services Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ServicesElements.self, from: data)
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
    static func loadSingleServices(id: Int, completion: @escaping (ServicesElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_SERVICES_URL) else {return}
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
                          "countryID": nil,
                          "paymentTime": nil,
                          "transportation": false] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single Service Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ServicesElements.self, from: data)
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
    
    // MARK: - Get TourismAndREST
    static func loadTourismAndREST(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (TourismAndRESTElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_TOURISMANDREST_URL) else {return}
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
                          "countryID": nil,
                          "departureDay": nil,
                          "returnDay": nil,
                          "reservedTickets": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load TourismAndREST Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(TourismAndRESTElements.self, from: data)
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
    static func loadSingleTourismAndREST(id: Int, completion: @escaping (TourismAndRESTElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_TOURISMANDREST_URL) else {return}
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
                          "countryID": nil,
                          "departureDay": nil,
                          "returnDay": nil,
                          "reservedTickets": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single TourismAndREST Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(TourismAndRESTElements.self, from: data)
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
    
    // MARK: - Get Exchange
    static func loadExchange(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (ExchangeElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_EXCHANGE_URL) else {return}
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
                print("Load Exchange Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ExchangeElements.self, from: data)
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
    static func loadSingleExchange(id: Int, completion: @escaping (ExchangeElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_EXCHANGE_URL) else {return}
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
                print("Load Single Exchange Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(ExchangeElements.self, from: data)
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
    
    
    // MARK: - Get Vehicle
    static func loadVehicle(pageNumber: Int, adCount: Int, subCategoryID: Int, completion: @escaping (VehicleElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_VEHICLE_URL) else {return}
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
                          "countryID": nil,
                          "mark": nil,
                          "model": nil,
                          "productionYearFrom": nil,
                          "productionYearTo": nil,
                          "mileageFrom": nil,
                          "mileageTo": nil,
                          "customsCleared": false,
                          "bodyType": nil,
                          "engineType": nil,
                          "engineSizeFrom": nil,
                          "engineSizeTo": nil,
                          "driveType": nil,
                          "transmisionype": nil,
                          "color": nil,
                          "wheel": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Vehicle Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(VehicleElements.self, from: data)
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
    static func loadSingleVehicle(id: Int, completion: @escaping (VehicleElements?) -> Void) {
        guard let url = URL(string: RequestManager.baseURL + GET_VEHICLE_URL) else {return}
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
                          "countryID": nil,
                          "mark": nil,
                          "model": nil,
                          "productionYearFrom": nil,
                          "productionYearTo": nil,
                          "mileageFrom": nil,
                          "mileageTo": nil,
                          "customsCleared": false,
                          "bodyType": nil,
                          "engineType": nil,
                          "engineSizeFrom": nil,
                          "engineSizeTo": nil,
                          "driveType": nil,
                          "transmisionype": nil,
                          "color": nil,
                          "wheel": nil] as [String : Any?]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {fatalError() }
        request.httpBody = httpBody
        URLSession.shared.dataTask(with: request) {data, response, error in
            let resp = response as! HTTPURLResponse
            guard let data = data else {return}
            do{
                print("Load Single Vehicle Response Status code: ",resp.statusCode)
                let decodedData = try? JSONDecoder().decode(VehicleElements.self, from: data)
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
