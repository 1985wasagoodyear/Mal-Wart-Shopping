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
    var product: Product
    
    var body: some View {
        HStack {
            /*product.image
                .resizable()
                .frame(width: 50, height: 50)*/
            Text(product.name)
            Spacer()
        }
    }
}

struct MainProductRow_Previews: PreviewProvider {
    static var previews: some View {
        MainProductRow(product: SampleProducts.bread.makeProduct())
    }
}
