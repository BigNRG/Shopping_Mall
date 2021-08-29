//
//  UserOwnerModel.swift
//  Shopping_Mall
//
//  Created by Harut on 05.07.21.
//

import Foundation
import UIKit

// MARK: - UserOwnerElement
struct UserOwnerElement: Codable {
    let category: Categorys
    let ads: [Add]
}

// MARK: - Ad
struct Add: Codable {
    let id: Int
    let name: String
    let userID: Int
    let adDescription: String
    let image: String
    let owner: Int
    
    enum CodingKeys: String, CodingKey {
        case id, name, userID
        case adDescription = "description"
        case image, owner
    }
}

// MARK: - Category
struct Categorys: Codable {
    let id: Int
    let name: String
}

typealias UserOwner = [UserOwnerElement]
