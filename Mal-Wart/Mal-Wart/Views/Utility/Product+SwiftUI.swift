//
//  Product+SwiftUI.swift
//  Created 8/4/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import SwiftUI

struct PriceFormatter {
    
    static let formatter: NumberFormatter = {
      let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    static func currencyText(double: Double) -> String {
        let nsNumber = NSNumber(value: double)
        return formatter.string(from: nsNumber) ?? String(format: "$%.2f", double)
    }
}

// https://forums.swift.org/t/conditionally-apply-modifier-in-swiftui/32815/3
extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            return AnyView(content(self))
        } else {
            return AnyView(self)
        }
    }
}
