
import SwiftUI

struct CartView: View {
    @Environment(CartModel.self) private var cart
  //  private var cart = CartModel().createMockCart()
    var body: some View {

        ScrollView{
            ForEach(self.cart.items, id: \.self){ item in
               // ForEach(basket.items, id: \.self){ item in
                    Text("The Gaming Palace")
                    HStack(spacing: 10){
                        Text("\(item.productName)")
                        Text("\(item.price.formatAsCurrency())")
                    }
                //}
            }
        }
        .padding()
    }
}

#Preview {
    CartView().environment(CartModel())
}
