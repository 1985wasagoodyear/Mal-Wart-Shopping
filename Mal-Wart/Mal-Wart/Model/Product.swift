//
//  Product.swift
//  Created 8/3/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

struct Product: Identifiable {
    let id: Int
    let name: String
    let images: [ProductImage]
    let price: Double
    let unitPrice: UnitPrice
    let ingredients: [Ingredient]
    let productFeatures: String
    let nutritionFacts: NutritionFacts
    let isSponsored: Bool
}

struct ProductImage {
    let imageName: String
    let imageURL: String?
    let type: String
}

/// describes a product's price-per-unit, e.g.: 19.2 cents/OZ
struct UnitPrice {
    let price: Double
    let currencyUnit: String
    let itemUnit: String
    
    var text: String {
        "(\(price) \(currencyUnit)/\(itemUnit))"
    }
}

struct Ingredient {
    let name: String
}

extension Array where Element == Ingredient {
    init(names: String...) {
        var array = [Element]()
        array.reserveCapacity(names.count)
        names.forEach {
            array.append(Ingredient(name: $0))
        }
        self = array
    }
}

struct NutritionFacts {
    let servingSize: ServingSize
    let calories: Int
    let fat: Int
    let sodium: Int
    let carbs: Int
    let fiber: Int
    let sugars: Int
    let protein: Int
}

struct ServingSize {
    let grams: Int
    let unitDescription: String
}
