
import SwiftUI

struct CartView: View {
    @Environment(CartModel.self) private var cart
  //  private var cart = CartModel().createMockCart()
    var body: some View {
            ScrollView{
                Grid(alignment: .leadingFirstTextBaseline,
                     horizontalSpacing: 5,
                     verticalSpacing: 20){
                    GridRow {
                        Text("Item")
                        Text("Quantity")
                        Text("Price")
                    }
                    .font(.title2)
                    Divider()
                    ForEach(self.cart.items, id: \.self){ item in
                        GridRow{
                            Text("\(String(describing: item.productName!))")
                            Text("\(item.quantity!)").gridColumnAlignment(.center)
                            Text("\(item.price.formatAsCurrency())")
                                .gridColumnAlignment(.center)
                        }
                        .font(.title3)
                    }
                }
                .padding()
            }
        }
    }

#Preview {
    CartView().environment(CartModel().createMockCart())
}
