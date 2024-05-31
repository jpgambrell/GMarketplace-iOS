//
//  ProductDetailsView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/14/24.
//

import SwiftUI

struct ProductDetailsView: View {
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
                VStack{
                    Text(product.name ?? "")
                    Text("$\(String(describing:product.price ?? 0.0))")
                    Spacer()
                    Text(product.description ?? "")
                }
            } placeholder: {
                ProgressView()
            }
        }.padding(.top, 40)
        //            .toolbar {
        //                   ToolbarItem(placement: .navigationBarLeading) {
        //                       Button(action: {
        //                           navigationPath.removeLast()
        //                       }) {
        //                           Image(systemName: "chevron.left")
        //                           Text("Back")
        //                       }
        //                   }
        //               }
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    struct Preview: View {
            @State var navigationPath = NavigationPath()
            var body: some View {
                ProductDetailsView(navigationPath: $navigationPath, product: CatalogModel())
            }
        }

        return Preview()

    
}
