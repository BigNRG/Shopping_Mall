//
//  ADDataModel.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

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

