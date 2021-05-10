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

// MARK: - UserResponse Model
struct UserResponse: Codable {
    let id: Int
    let phoneNumber, firstName: String
    let lastName: JSONNull
    let email: String
    let state, country, region, city: Int
    let address: JSONNull
    let rating, balance: Double
    let avatar: JSONNull
}

// MARK: - Encode/decode helpers
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
