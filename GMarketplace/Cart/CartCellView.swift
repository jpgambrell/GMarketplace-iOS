
import SwiftUI

struct CartCellView: View {
    @State var quantity = 0
    var item : CartItem
    init(cartItem: CartItem){
        self.item = cartItem
        quantity = cartItem.quantity ?? 0
    }
    var body: some View {
        VStack{
            HStack(alignment: .center) {
                Text((item.productName ?? "N/A"))
                    .font(.title2)
                Spacer()
                Text("\(item.price.formatAsCurrency())")
                    .font(.title2)
            }.padding([.leading, .trailing], 20)
            HStack{
                Button {
                    quantity = quantity - 1
                } label: {
                    Image(systemName: "minus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                        .tint(.black)
                        .padding(15)
                        .overlay(Circle().stroke(.gray, lineWidth: 1))
                }

                
                Text("\(quantity)")
                    .font(.title2)
                    .padding()
                Button {
                    quantity = quantity + 1
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                        .tint(.black)
                        .padding(15)
                        .overlay(Circle().stroke(.gray, lineWidth: 1))
                        
                }
                
            }
        }
    }
}

#Preview {
    CartCellView(cartItem: CartItem(id: 99, productId: "prodID444", productName: "Xbox One", quantity: 1, price: 32.30))
}
