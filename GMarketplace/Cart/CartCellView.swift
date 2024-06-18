
import SwiftUI

struct CartCellView: View {
    var item : CartItem
    init(cartItem: CartItem){
        self.item = cartItem
    }
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                Text((item.productName ?? "N/A"))
                Spacer()
                //
                Text("\(item.price.formatAsCurrency())")
            }.padding()
            HStack{
                Image(systemName: "plus")
                Text("\(item.quantity ?? 0)")
                Image(systemName: "minus") 
            }
        }
    }
}

#Preview {
    CartCellView(cartItem: CartItem(id: 99, productId: "prodID444", productName: "Xbox One", quantity: 1, price: 32.30))
}
