//
//  ProductDetailsView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/14/24.
//

import SwiftUI

struct ProductDetailsView: View {
    @Environment(CartModel.self) private var cart
    @Binding var navigationPath: NavigationPath
    @State private var toast: Toast? = nil
    let product: CatalogModel
    var body: some View {
        VStack{
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
                        Text("\(product.price?.formatAsCurrency() ?? "Price N/A")")
                            .font(.title)
                        Spacer()
                        Text(product.description ?? "")
                    }.padding(.horizontal, 20)
                } placeholder: {
                    ProgressView()
                }
            }
            .padding(.top, 10)
            Spacer()
            Button("Add to Cart") {
                
                cart.add(item: CartItem(id: UUID(), productId: product.id!, productName: product.name!, quantity: 1, price: product.price!))
                toast = Toast(style: .success, message: "Saved.")
                
            }.padding(20)
        } .toastView(toast: $toast)
           
    }
}

#Preview {
    struct Preview: View {
            @State var navigationPath = NavigationPath()
            var body: some View {
                ProductDetailsView(navigationPath: $navigationPath, product: mockProduct()).environment(CartModel().createMockCart()).task{
                    
                }
            }
        }
    func mockProduct() -> CatalogModel {
        return CatalogModel(average_rating: 3.7, sub_category: "Mens", category: "Clothing", images: ["https://media.gamestop.com/i/gamestop/11143293/Honu-Turtle-Hawaiian-Islands-Word-Art-Womens-Premium-Blend-T-Shirt?$pdp2x$"], brand: "Gap", specs: "", price: 20.40, description: "The Show is back! MLB The Show brings you the best of baseball. Play America's pastime your way, with new game modes, expanded team building and player customization, and an extensive personalized RPG experience. Create your own player and rise through the MLB ranks or play against others as baseball's greatest stars and legends. Fierce online competition*, exciting RPG action, lightning fast gameplay‚Äì‚ÄìThe Show 19 has it all. ", id: "32424", name: "Cool Shirt", sku: "32424", availability: "IN STOCK")
    }

        return Preview()

    
}
