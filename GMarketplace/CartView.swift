
import SwiftUI

struct CartView: View {
    @EnvironmentObject private var cart: CartModel
    var body: some View {
        VStack {
            
           
        }
        .padding()
    }
}

#Preview {
    CartView().environmentObject(CartModel().createMockCart())
}
