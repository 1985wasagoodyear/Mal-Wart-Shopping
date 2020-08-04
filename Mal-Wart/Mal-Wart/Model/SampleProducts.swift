//
//  SampleProducts.swift
//  Created 8/3/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import Foundation

enum SampleProducts: String {
    case bread = "Bread"
}

extension SampleProducts {
    func makeProduct(name: String? = nil) -> Product {
        let name = name ?? rawValue
        switch self {
        case .bread:
            return SampleProducts.makeBreadProduct(name: name)
        }
    }
}


private extension SampleProducts {
    static var currentId: Int = 0
    static func makeBreadProduct(name: String = "Bread") -> Product {
        defer { currentId += 1 }
        let images = [ProductImage(imageName: name,
                                   imageURL: nil,
                                   type: "bread")]
        let unitPrice = UnitPrice(price: 4.99,
                                  currencyUnit: "dollars",
                                  itemUnit: "loaf")
        let ingredients = [Ingredient](names: "Enriched Wheat Flour", "Water",
                                       "Wheat Gluten", "Yeast", "Soybean Oil",
                                       "Sugar", "Salt", "Dextrose")
        let features =
        """
Mr. Murton is a therapy patient who had a failed business in the past and a divorced wife. He is distressed over alleged break-ins into his house with the culprit supposedly leaving behind pieces of toasted bread as a taunt or warning. With each scenario, Mr. Murton progressively finds out that the culprit of the disarranged house are sentient slices of a specific bread, and at the end, throws the bread out in the trash and escapes custody from the therapy building. After a slice of bread that escaped the garbage truck causes an explosion at a gas station, another slice of bread confronts Mr. Murton while he is driving away from the scene with the intent of eliminating the bread. Terrified, Mr. Murton suffers from what appears to be a heart attack and faints, resulting in a car crash and Mr. Murton becomes injured and falls unconscious. Some time after the crash, Nigel Burke, a mysterious man with a watch, pulls over and investigates and grabs Mr. Murton off-screen, and in front of the car is a Barnardshire Sign indicating that I am Bread is a prequel to Surgeon Simulator 2013, another game by Bossa Studios.
"""
        let servingSize = ServingSize(grams: 60, unitDescription: "slice")
        let facts = NutritionFacts(servingSize: servingSize,
                                   calories: 210, fat: 6,
                                   sodium: 250,
                                   carbs: 35, fiber: 2, sugars: 3,
                                   protein: 8)
        return Product(id: currentId, name: name, images: images,
                       price: 4.99, unitPrice: unitPrice,
                       ingredients: ingredients, productFeatures: features,
                       nutritionFacts: facts, isSponsored: false)
    }
}
