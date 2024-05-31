//
//  ProductDetailsView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/14/24.
//

import SwiftUI

struct ProductDetailsView: View {
    @EnvironmentObject private var cart: CartModel
    @Binding var navigationPath: NavigationPath
    let product: CatalogModel
    var body: some View {
        HStack(alignment: .top){
            HeaderView(headerViewState: .detail, path: $navigationPath)
        }
        
        ScrollView{
            AsyncImage(url: URL(string: product.images?.first ?? "")) {
                image in
                
                VStack{
                    image
                        .resizable()
                    
                        .clipShape(.rect(cornerRadius: 5))
                    
                }
                .frame(width: 300, height: 300)
                .padding()
                Spacer()
                VStack(alignment: .leading, spacing:5){
                    Text(product.name ?? "").font(.title)
                    Text("$\(String(describing:product.price ?? 0.0))")
                        .font(.title)
                    Spacer()
                    Text(product.description ?? "")
                }.padding(.horizontal, 20)
            } placeholder: {
                ProgressView()
            }
        }.padding(.top, 10)
        Spacer()
        Button("Add to Cart") {
            print("add clicked \(String(describing: cart.merchantCarts.first?.merchant))")
        }.padding(20)
       
    }
}

#Preview {
    struct Preview: View {
            @State var navigationPath = NavigationPath()
            var body: some View {
                ProductDetailsView(navigationPath: $navigationPath, product: CatalogModel()).environmentObject(CartModel().createMockCart())
            }
        }

        return Preview()

    
}
