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
         SampleProducts.bread.makeProduct(name: "Sugar Loaf"),
         SampleProducts.bread.makeProduct(name: "Gluten-free"),
         SampleProducts.bread.makeProduct(name: "Rye"),
         SampleProducts.bread.makeProduct(name: "Half-and-half"),
         SampleProducts.bread.makeProduct(name: "Pre-toasted")]
    }()
    
    var body: some View {
        NavigationView {
            List(products) { product in
                NavigationLink(destination: ProductDetailsView(product: product)) {
                    MainProductRow(product: product)
                }.accessibility(identifier: product.name)
            }
            .navigationBarTitle("Bread Aisle")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainProductsView()
    }
}
