//
//  GeneralDataModel.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

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


