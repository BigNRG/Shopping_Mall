//
//  JsonDataModels.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/10/21.
//

import Foundation
import UIKit

// MARK: - UserBody Model
struct UserBody: Codable {
    var userID: String
    var userSecret: String
}

// MARK: - Token Model
struct TokenModel: Codable {
    var token: String
}

// MARK: - CreateUserModel
struct CreateUserModel: Codable {
    let phoneNumber, firstName, email, password: String
    let country: Int
}

// MARK: - SendConfirmEmail
struct SendConfirmEmail: Codable {
    let email: String
}

// MARK: - UserModel
struct UserModel: Codable {
    let id: Int
    let phoneNumber, firstName: String
    let lastName: JSONNull?
    let email: String
    let state, country, region, city: Int
    let address: JSONNull?
    let rating, balance: Int
    let avatar: JSONNull?
}

// MARK: - MainCategory
struct MainCategory: Codable {
    let id: Int
    let category: String
}

typealias MainCategories = [MainCategory]

// MARK: - SubCategory
struct SubCategory: Codable {
    let id: Int
    let type: String
    let baseCategoryID: Int
}

typealias SubCategories = [SubCategory]


// MARK: - MainPage
struct MainPage: Codable {
    let bestExchange: JSONNull?
    let adsWithCategories: [AdsWithCategory]
}

// MARK: - AdsWithCategory
struct AdsWithCategory: Codable {
    let category: Category
    let ads: [Ad]
}

// MARK: - Ad
struct Ad: Codable {
    let id: Int
    let name: String
    let userID: Int
    let adDescription: Description
    let image: String
    let owner: Int

    enum CodingKeys: String, CodingKey {
        case id, name, userID
        case adDescription = "description"
        case image, owner
    }
}

enum Description: String, Codable {
    case appilances = "appilances"
    case asdjadkjhdkjasmcxjknsZdjkalsnd = "asdjadkjhdkjasmcxjkns,zdjkalsnd"
    case string = "string"
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
}

// MARK: - GetSaleElement
struct GetSaleElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let getSaleDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case getSaleDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList
    }
}

typealias GetSale = [GetSaleElement]


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MARK: - Encode/decode helpers - JSONNull
class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    //    public var hashValue: Int {
    //        return 0
    //    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
