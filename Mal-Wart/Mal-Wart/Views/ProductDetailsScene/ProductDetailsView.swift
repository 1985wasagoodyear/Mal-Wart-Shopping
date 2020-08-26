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
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                Image(product.images[0].type)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .accessibility(identifier: product.images[0].imageName)
                Text(product.name)
                Text(PriceFormatter.currencyText(double: product.price))
                    .padding(.bottom, 8.0)
                Text(product.productFeatures)
                    .padding(.bottom, 20.0)
            }
            .padding(8.0)
        }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: SampleProducts.bread.makeProduct())
    }
}
