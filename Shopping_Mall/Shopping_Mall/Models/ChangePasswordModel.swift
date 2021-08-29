//
//  ChangePasswordModel.swift
//  Shopping_Mall
//
//  Created by Harut on 07.07.21.
//

import Foundation

// MARK: - ChangePassword
struct ChangePassword: Codable {
    
    let phoneNumber: String
    let oldPassword: String
    let newPassword: String
    
}
