//
//  UserDataModel.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

// MARK: - UserBody Model
struct UserBody: Codable {
    var userID: String
    var userSecret: String
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
