//
//  AdGetDataModel.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/23/21.
//

import Foundation
import UIKit

// MARK: - GetSale
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


// MARK: - GetWork
struct GetWorkElement: Codable {
    let paymentTime, id, userID, subCategoryID: Int
    let currency, price, country, region: Int
    let city, state: Int
    let getWorkElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]

    enum CodingKeys: String, CodingKey {
        case paymentTime, id, userID, subCategoryID, currency, price, country, region, city, state
        case getWorkElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList
    }
}

typealias GetWorkElements = [GetWorkElement]


// MARK: - GetSport
struct GetSportElement: Codable {
    let paymentTime, id, userID, subCategoryID: Int
    let currency, price, country, region: Int
    let city, state: Int
    let getSportElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]

    enum CodingKeys: String, CodingKey {
        case paymentTime, id, userID, subCategoryID, currency, price, country, region, city, state
        case getSportElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList
    }
}

typealias GetSportElements = [GetSportElement]


// MARK: - GetEverythingElse
struct GetEverythingElseElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let getEverythingElseElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case getEverythingElseElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList
    }
}

typealias GetEverythingElseElements = [GetEverythingElseElement]


// MARK: - GetPetsAndPlant
struct PetsAndPlant: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let petsAndPlantDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case petsAndPlantDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState
    }
}

typealias PetsAndPlants = [PetsAndPlant]


// MARK: - GetCulture
struct CultureElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let cultureDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case cultureDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState
    }
}

typealias CultureElements = [CultureElement]


// MARK: - GetHealfCare
struct HaelfCareElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let haelfCareElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case haelfCareElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState
    }
}

typealias HealfCareElements = [HaelfCareElement]


// MARK: - GetFurniture
struct FurnitureElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let furnitureElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case furnitureElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState
    }
}

typealias FurnitureElements = [FurnitureElement]


// MARK: - GetForHomeAndGarden
struct ForHomeAndGardenElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let forHomeAndGardenElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case forHomeAndGardenElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState
    }
}

typealias ForHomeAndGardenElements = [ForHomeAndGardenElement]


// MARK: - HouseholdGoods
struct HouseholdGoodsElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let householdGoodsElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case householdGoodsElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState
    }
}

typealias HouseholdGoodsElements = [HouseholdGoodsElement]


// MARK: - Construction
struct ConstructionElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let constructionElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case constructionElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState
    }
}

typealias ConstructionElements = [ConstructionElement]


// MARK: - Electronics
struct ElectronicsElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let electronicsElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case electronicsElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState
    }
}

typealias ElectronicsElements = [ElectronicsElement]


// MARK: - Acquaintance
struct AcquaintanceElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let acquaintanceElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let gender: Bool
    let aim, height, weight: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case acquaintanceElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, gender, aim, height, weight
    }
}

typealias AcquaintanceElements = [AcquaintanceElement]


// MARK: - Appliances
struct AppliancesElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let appliancesElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case appliancesElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState
    }
}

typealias AppliancesElements = [AppliancesElement]


// MARK: - CigaretteAndAlcohol
struct CigaretteAndAlcoholElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let cigaretteAndAlcoholElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int
    let isLocal: Bool
    let alcoholVolume: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case cigaretteAndAlcoholElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState, isLocal, alcoholVolume
    }
}

typealias CigaretteAndAlcoholElements = [CigaretteAndAlcoholElement]


// MARK: - ClothesAndShoes
struct ClothesAndShoesElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let clothesAndShoesElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int
    let clothingSize: String
    let shoesSize: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case clothesAndShoesElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState, clothingSize, shoesSize
    }
}

typealias ClothesAndShoesElements = [ClothesAndShoesElement]


// MARK: - ForChildren
struct ForChildrenElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let forChildrenElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int
    let gender, forNewBorns: Bool

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case forChildrenElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState, gender, forNewBorns
    }
}

typealias ForChildrenElements = [ForChildrenElement]


// MARK: - JewerlyAndAccessories
struct JewerlyAndAccessoriesElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let jewerlyAndAccessoriesElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, productState: Int
    let gender: Bool

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case jewerlyAndAccessoriesElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, productState, gender
    }
}

typealias JewerlyAndAccessoriesElements = [JewerlyAndAccessoriesElement]


// MARK: - ProductsAndDrinks
struct ProductsAndDrinksElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let productsAndDrinksElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim: Int
    let isLocal, isFrozen, isNaturalDrink: Bool

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case productsAndDrinksElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, isLocal, isFrozen, isNaturalDrink
    }
}

typealias ProductsAndDrinksElements = [ProductsAndDrinksElement]


// MARK: - RealEstate
struct RealEstateElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let realEstateElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim, space, constructionType, paymentTime: Int
    let rooms, floor: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case realEstateElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, space, constructionType, paymentTime, rooms, floor
    }
}

typealias RealEstateElements = [RealEstateElement]


// MARK: - Services
struct ServicesElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let servicesElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let paymentTime: Int
    let transportation: Bool

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case servicesElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, paymentTime, transportation
    }
}

typealias ServicesElements = [ServicesElement]


// MARK: - TourismAndREST
struct TourismAndRESTElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let tourismAndRESTElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let aim: Int
    let departureDay, returnDay: String
    let reservedTickets: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case tourismAndRESTElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, aim, departureDay, returnDay, reservedTickets
    }
}

typealias TourismAndRESTElements = [TourismAndRESTElement]


// MARK: - Exchange
struct ExchangeElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let exchangeElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let sourceCurrencyID, destinationCurrencyID, saleSummaRetail, buySummaRetail: Int
    let saleSumma, buySumma: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case exchangeElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, sourceCurrencyID, destinationCurrencyID, saleSummaRetail, buySummaRetail, saleSumma, buySumma
    }
}

typealias ExchangeElements = [ExchangeElement]


// MARK: - Vehicle
struct VehicleElement: Codable {
    let id, userID, subCategoryID, currency: Int
    let price, country, region, city: Int
    let state: Int
    let vehicleElementDescription, name: String
    let locationLatitude, locationLongitude: Int
    let contact: String
    let owner: Int
    let comment: String
    let view: Int
    let tags: String
    let imagesList: [String]
    let mark, model, aim: Int
    let productionYear: String
    let customsCleared: Bool
    let mileage, bodyType, engineType, engineSize: Int
    let driveType, transmissionType, color, wheel: Int

    enum CodingKeys: String, CodingKey {
        case id, userID, subCategoryID, currency, price, country, region, city, state
        case vehicleElementDescription = "description"
        case name, locationLatitude, locationLongitude, contact, owner, comment, view, tags, imagesList, mark, model, aim, productionYear, customsCleared, mileage, bodyType, engineType, engineSize, driveType, transmissionType, color, wheel
    }
}

typealias VehicleElements = [VehicleElement]
