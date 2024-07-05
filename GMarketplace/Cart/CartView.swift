
import SwiftUI

struct CartView: View {
    @Environment(CartService.self) private var cartService
    
    var body: some View {
        
        List(){
            Section("Cart") {
                ForEach((self.cartService.cart?.items)!) {item in
                    CartCellView(cartItem: item)
                }
            }
        }.refreshable {
            Task{
                do {
                    try await cartService.getCart()
                }
                catch{
                    print(error)
                }
            }
        }
    }
}
  

#Preview {
    CartView().environment(CartService())
}
