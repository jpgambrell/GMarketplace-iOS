
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
            if showCheckoutBtn {
                Button(action: {
                    print("item count: \(String(describing: cartService.cart.items.count))")
                }, label: {
                    Text("Checkout")
                })
            }
        }.refreshable {
            Task{
                do {
                    try await cartService.getCart()
                   // guard let count = cartService.cart?.items.count else {return}
                    showCheckoutBtn = (cartService.cart.items.count > 0 ? true : false)
                }
                catch{
                    print(error)
                }
            }
        }
        .onChange(of: cartService.cart.items.count) { _, newValue in
           // guard let count = cartService.cart?.items?.count else {return}
            showCheckoutBtn = (newValue > 0 ? true : false)
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
            return cartService
        }
        return Preview().environment(getCartService())
    
}

