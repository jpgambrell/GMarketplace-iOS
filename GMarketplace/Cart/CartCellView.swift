
import SwiftUI

struct CartCellView: View {
    @Environment(CartService.self) var cartService
    @State var quantity = 0
    var item : CartItem
    init(cartItem: CartItem){
        self.item = cartItem
        quantity = cartItem.quantity ?? 0
    }
    var body: some View {
        VStack{
            
            
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: item.productImageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:100)
                } placeholder: {
                    ProgressView()
                }
                Text((item.productName ?? "N/A"))
                    .font(.title2)
                    .padding(.top, 12)
                Spacer()
                Text("\(item.price.formatAsCurrency())")
                    .font(.title2)
                    .padding(.top, 12)
            }.padding([.leading, .trailing], 20)
            
            HStack{
                Button {
                    if quantity > 0 {
                        quantity = quantity - 1
                        //TODO update cart
                    }
                } label: {
                    Image("reduceStepper")
                        .resizable()
                        .scaledToFit()
                        .colorMultiply(.white)
                    .frame(width: 40, height: 40)                }
                
                
                Text("\(quantity)")
                    .font(.title2)
                    .padding()
                Button {
                    quantity = quantity + 1
                    //TODO update cart
                } label: {
                    Image("increaseStepper")
                        .resizable()
                        .scaledToFit()
                        .colorMultiply(.white)
                        .frame(width: 40, height: 40)
                    
                }
                
            }
        }
    }
        }

#Preview {
    CartCellView(cartItem: CartItem(id: 99, productId: "prodID444", productName: "Xbox One", quantity: 1, price: 32.30, productImageURL: "https://media.gamestop.com/i/gamestop/11103843/Lite-Brite-Mini?$pdp2x$" )).environment(CartService())
}
