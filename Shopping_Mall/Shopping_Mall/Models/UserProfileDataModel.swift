//
//  UserProfileDataModel.swift
//  Shopping_Mall
//
//  Created by Harut on 03.07.21.
//

import Foundation

// MARK: - UserProfileDataModel
struct UserProfileDataModel: Codable {
    let id: Int?
    let phoneNumber: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let state: Int?
    let country: Int?
    let region: Int?
    let city: Int?
    let address: String?
    let rating: Double?
    let balance: Int?
    let avatar: String?
}
