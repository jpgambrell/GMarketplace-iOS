
import SwiftUI

struct CartCellView: View {
    @Environment(CartService.self) var cartService
    @State var quantity: Int
    var item : CartItem
    init(cartItem: CartItem){
        item = cartItem
        quantity = cartItem.quantity 
    }
    var body: some View {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: item.productImageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:75)
                        //.padding(1)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading){
                    Text((item.productName))
                        .font(.subheadline).bold()
                        .lineLimit(2)
                          .truncationMode(.tail)
                        .padding(.top, 12)
                        
                    HStack(){
                        Button {
                            if quantity > 0 {
                                quantity = quantity - 1
                            }
                        } label: {
                                Image((quantity > 1) ?"reduceStepper" : "trashCan")
                                .resizable()
                                .scaledToFit()
                                .colorMultiply(.white)
                                .frame(width: 40, height: 40)
                        }.buttonStyle(BorderlessButtonStyle())
                            
                        
                        
                        Text("\(quantity)")
                            .font(.subheadline)
                            .padding()
                        Button {
                            quantity = quantity + 1
                        } label: {
                            Image("increaseStepper")
                                .resizable()
                                .scaledToFit()
                                .colorMultiply(.white)
                                .frame(width: 40, height: 40)
                            
                        }.buttonStyle(BorderlessButtonStyle())
                        
                    }
                    .frame(width: 150)
                        .onChange(of: quantity) { _, newValue in
                                Task{
                                    do {
                                       // guard let cartId = cartService.cart?.id else {return}
                                        if newValue == 0 {
                                            try await cartService.deleteFromCart(cartId: cartService.cart.id,productId: item.productId)
                                        }
                                        else {
                                            try await cartService.updateCart(cartId: cartService.cart.id, productId: item.productId, quantity: quantity)
                                        }
                                    }
                                    catch {
                                        throw(error)
                                    }
                                }
                        }
                        
                }
                Spacer()
                Text("\(item.price.formatAsCurrency())")
                    .font(.subheadline)
                    .padding(.top, 12)
            }//.padding([.leading, .trailing], 20)
            

        
    }
        }

#Preview {
    CartCellView(cartItem: CartItem(id: 99, productId: "prodID444", productName: "Xbox One with a kung fu grip and chucks", quantity: 1, price: 332.30, productImageURL: "https://media.gamestop.com/i/gamestop/11103843/Lite-Brite-Mini?$pdp2x$" )).environment(CartService())
}
