//
//  ProductDetailsView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/14/24.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: CatalogModel
    var body: some View {
        Spacer()
        ScrollView{
            Spacer()
            
            VStack{
                ZStack{
                    Rectangle()
                        .fill(.green.opacity(0.5))
                        .frame(width: 300, height: 300)
                    Text("Product Image here")
                }
                Spacer()
                VStack{
                    Text(product.name ?? "")
                    Text("$\(String(describing:product.price ?? 0.0))")
                Spacer()
                    Text(product.description ?? "")
                    
                }
                
            }
        }
    }
}

#Preview {
    ProductDetailsView(product: CatalogModel())
}
