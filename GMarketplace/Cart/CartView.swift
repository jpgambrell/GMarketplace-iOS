
import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cart: CartModel
    var body: some View {
        ScrollView{
            ForEach(cart.merchantCarts, id: \.self){ basket in
                ForEach(basket.items, id: \.self){ item in
                    HStack(spacing: 10){
                        Text("\(item.productName)")
                        Text("\(item.price)")
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    CartView().environmentObject(CartModel().createMockCart())
}
