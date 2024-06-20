
import SwiftUI

struct CartView: View {
    @Environment(CartService.self) private var cartService
    
    var body: some View {
        
        List(){
            Section("Cart") {
                ForEach(self.cartService.cart.items) {item in
                    CartCellView(cartItem: item)
//                    VStack(alignment: .leading){
//                        HStack(alignment: .center) {
//                            Text(item.productName!)
//                            Spacer()
//                            Text("\(item.quantity!)")
//                            Text("\(item.price.formatAsCurrency())")
//                        }
//                    }
                }
            }
        }
        
    }
}
        
        
        //          ScrollView{
        //               Grid(alignment: .leadingFirstTextBaseline,
        //                    horizontalSpacing: 5,
        //                     verticalSpacing: 20){
        //                    GridRow {
        //                        Text("Item")
        //                        Text("Quantity")
        //                        Text("Price")
        //                    }
        //                    .font(.title2)
        //                    Divider()
        //                    ForEach(self.cart.items, id: \.self){ item in
        //                        GridRow{
        //                            Text("\(String(describing: item.productName!))")
        //                            Text("\(item.quantity!)").gridColumnAlignment(.center)
        //                            Text("\(item.price.formatAsCurrency())")
        //                                .gridColumnAlignment(.center)
        //                        }
        //                        .font(.title3)
        //                    }
        //                }
        //               .padding()
        //           }
        //
        
   

#Preview {
    CartView().environment(CartService())
}
