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
            VStack {
                Image(product.images[0].type)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(8.0)
                    .accessibility(identifier: product.images[0].imageName)
                Text(product.name)
                Text(PriceFormatter.currencyText(double: product.price))
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: SampleProducts.bread.makeProduct())
    }
}
