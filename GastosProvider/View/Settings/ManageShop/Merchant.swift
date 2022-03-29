//
//  Merchant.swift
//  GastosProvider
//
//  Created by ehsan sat on 3/27/22.
//

import Foundation

struct Merchant: Identifiable, Hashable, Equatable, Codable {
    
    var email: String?
    var name: String?
    var intern: String?
    var phone: String?
    var pin: String?
    var id: String? {
        return phone
    }
    var shop: Shop
    
}

struct Shop: Hashable, Equatable, Codable {
        
    var category: ShopCategory?
    var creationTimeStamp: Double?
    var homeDelivery: Bool?
    var location: String?
    var margin: String?
    var mrpitem: Bool?
    var pickUp: Bool?
    var shopAddress: String?
    var shopAddressLatitude: String?
    var shopAddressLongitude: String?
    var shopImageURI: String?
    var shopImageURI1: String?
    var shopImageURI2: String?
    var shopImageURI3: String?
    var shopImageURI4: String?
    var shopName: String?
    var discounts: [ShopDiscount]?
//    var id: String? {
//        return shopAddressLatitude
//    }
    
    static func convert(txt: String) -> ShopCategory? {
        if txt == ShopCategory.stores.rawValue {
            return ShopCategory.stores
        } else if txt == ShopCategory.food.rawValue {
            return ShopCategory.food
        } else if txt == ShopCategory.fashion.rawValue {
            return ShopCategory.fashion
        } else if txt == ShopCategory.salon.rawValue {
            return ShopCategory.salon
        } else if txt == ShopCategory.medical.rawValue {
            return ShopCategory.medical
        }
        return nil
    }
    
}

enum ShopCategory: String, Codable, Hashable {
    case stores = "Stores"
    case food = "Food & Beverages"
    case fashion = "Fashion"
    case salon = "Salon & Spa"
    case medical = "Medical"
}

struct ShopDiscount: Hashable, Codable {
    var discountPercentage: Double?
    var minBillAmount: Double?
}


