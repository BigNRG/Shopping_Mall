//
//  LocationDataModel.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

// MARK: - CountryElement
struct CountryElement: Codable {
    let id: Int
    let country: String
}
typealias Country = [CountryElement]

// MARK: - RegionElement
struct RegionElement: Codable {
    let id: Int
    let country: String
    let countryID: Int
}
typealias Region = [RegionElement]

// MARK: - CityElement
struct CityElement: Codable {
    let id: Int
    let country: String
    let countryID: Int
}

typealias City = [CityElement]
