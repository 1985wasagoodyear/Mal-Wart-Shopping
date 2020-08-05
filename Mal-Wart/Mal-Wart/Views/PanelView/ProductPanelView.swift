//
//  ProductPanelView.swift
//  Created 8/4/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import SwiftUI

struct ProductAddButton: View {
    @State var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(text).foregroundColor(Color.black)
        }
        .padding(.horizontal, 20.0)
        .padding(.vertical, 5.0)
        .overlay(
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(lineWidth: 2.0)
        )
    }
}

struct ProductPanelView: View {
    
    /// for debugging
    @State var showBorder: Bool = false
    var product: Product
    
    var body: some View {
        VStack(alignment: .center) {
            Image(product.images[0].type)
                .resizable()
                .frame(width: 75.0, height: 75.0, alignment: .center)
                .scaledToFit()
                .padding(8.0)
            VStack(alignment: .leading) {
                HStack(alignment: .center, spacing: 0.0) {
                    Text(PriceFormatter.currencyText(double: product.price))
                    Text(product.unitPrice.text)
                        .foregroundColor(.gray)
                }
                Text(product.name)
                    .padding(.bottom, 16)
                ProductAddButton(text: "Add") {
                    print("did tap button")
                }
            }
        }.if(showBorder) {
            $0.border(Color.red, width: 1.0)
        }
    }
}

struct ProductPanelView_Previews: PreviewProvider {
    static var previews: some View {
        ProductPanelView(product: SampleProducts.bread.makeProduct())
    }
}
