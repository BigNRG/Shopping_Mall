//
//  IdentityDataModel.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

// MARK: - Token Model
struct TokenModel: Codable {
    var token: String
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
