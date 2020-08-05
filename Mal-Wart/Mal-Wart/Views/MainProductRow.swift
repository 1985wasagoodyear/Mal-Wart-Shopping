//
//  MainProductRow.swift
//  Created 8/3/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import SwiftUI

struct MainProductRow: View {
    
    @State var showBorder: Bool = false
    var product: Product
    
    var body: some View {
        HStack(alignment: .center) {
            Image(product.images[0].type)
                .resizable()
                .frame(width: 75.0, height: 75.0, alignment: .center)
                .scaledToFit()
                .padding(8.0)
            VStack(alignment: .leading) {
                Text(product.name)
                HStack {
                    Text(PriceFormatter.currencyText(double: product.price))
                    Text(product.unitPrice.text)
                        .foregroundColor(.gray)
                }
            }
        }.if(showBorder) {
            $0.border(Color.red, width: 1.0)
        }
    }
    
}

struct MainProductRow_Previews: PreviewProvider {
    static var previews: some View {
        MainProductRow(product: SampleProducts.bread.makeProduct())
    }
}
