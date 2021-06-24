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
    let category: AdsCategory
    let ads: [Ad]
}

// MARK: - Ad
struct Ad: Codable {
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

// MARK: - AdsCategory
struct AdsCategory: Codable {
    let id: Int
    let name: String
}

// MARK: - BestExchange
struct BestExchange: Codable {
    let sale, buy: Int
    let symbol: String
    let userID, adID: Int
}
