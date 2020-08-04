//
//  MainProductsView.swift
//  Created 8/3/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import SwiftUI

struct MainProductsView: View {
    
    @State var products: [Product] = {
        [SampleProducts.bread.makeProduct(),
         SampleProducts.bread.makeProduct(name: "Whole Wheat Bread"),
         SampleProducts.bread.makeProduct(name: "Sugar Loaf")]
    }()
    
    var body: some View {
        NavigationView {
            List(products) { product in
                NavigationLink(destination: ProductDetailsView(product: product)) {
                    MainProductRow(product: product)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainProductsView()
    }
}
