
import SwiftUI

struct CartView: View {
    @Environment(CartService.self) private var cartService
    @State private var showCheckoutBtn: Bool = false
    var body: some View {
        VStack{
            List(){
                Section("Cart") {
                    ForEach(self.cartService.cart.items) {item in
                        CartCellView(cartItem: item)
                    }
                }
            }
            .overlay(alignment: .bottom) {
                if showCheckoutBtn {
                    Button(action: {
                        Task{
                            try await cartService.submitOrder(cartId: cartService.cart.id)
                        }
                        //print("item count: \(String(describing: ))")
                    }, label: {
                        Text("Checkout")
                            .font(.title)
                            .padding()
                                           .foregroundColor(.white)
                                           .frame(width: 250, height: 50)
                                           .background(Color.black)
                                           .cornerRadius(10)
                    }) .padding(.bottom, 50)

                        
                    
                }
            }
           
        }.refreshable {
            Task{
                do {
                    try await cartService.getCart(cartBy: .id, id: cartService.cart.id)
                }
                catch{
                    print(error)
                }
            }
        }
        .onChange(of: cartService.cart.items.count) { _, newValue in
            showCheckoutBtn = newValue > 0 ? true : false
        }
    }
}
  

#Preview {
    struct Preview: View {
        @State var cartService: CartService?
        var body: some View {
            CartView()
        }
    }
        func getCartService() -> CartService {
            let cartService = CartService()
            cartService.cart = CartModel()
            cartService.cart.createMockCartData()
            return cartService
        }
        return Preview().environment(getCartService())
    
}

