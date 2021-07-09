//
//  SearchDataModel.swift
//  Shopping_Mall
//
//  Created by Harut on 02.07.21.
//

import Foundation

// MARK: - SearchDataModelElement
struct SearchDataModelElement: Codable {
    let id, userID: Int
    let name: String
    let categoryID: Int
    let searchDataModelDescription: String
    let owner: Int
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id, userID, name, categoryID
        case searchDataModelDescription = "description"
        case owner, image
    }
}




