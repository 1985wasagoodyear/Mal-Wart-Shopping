//
//  ProductDetailsView.swift
//  Created 8/4/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import SwiftUI

struct ProductDetailsView: View {
    
    var product: Product
    
    var body: some View {
        NavigationView {
            Text(product.name)
        }.edgesIgnoringSafeArea(.all)
    }
}
