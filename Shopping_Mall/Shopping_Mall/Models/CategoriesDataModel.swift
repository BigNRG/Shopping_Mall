//
//  CategoriesDataModel.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
}

// MARK: - MainCategory
struct MainCategory: Codable {
    let id: Int
    let category: String
}

typealias MainCategories = [MainCategory]

// MARK: - SubCategory
struct SubCategory: Codable {
    let id: Int
    let type: String
    let baseCategoryID: Int
}

typealias SubCategories = [SubCategory]





