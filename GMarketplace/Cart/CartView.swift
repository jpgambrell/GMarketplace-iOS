
import SwiftUI

struct CartView: View {
    @Environment(CartService.self) private var cartService
    @State private var showCheckoutBtn: Bool = false
    @State private var showCheckoutView: Bool = false
    @State private var path = NavigationPath()
    
    var body: some View {
       
        NavigationStack(path: $path){
            HeaderView(headerViewState: .full, path: $path)
            List(){
                Section("Cart") {
                    ForEach(self.cartService.cart.items) {item in
                        CartCellView(cartItem: item)
                    }
                }
            }
            .navigationDestination(for: OrderSubmitModel.self) { order in
                VStack{
                    HeaderView(headerViewState: .detail, path: $path)
                    Spacer()
                    Text("Your cart status is\(order.status)")
                }
            }
            .sheet(isPresented: $showCheckoutView, content: {
                CheckoutView(order: OrderSubmitModel(cart: cartService.cart))
            })
            .overlay(alignment: .bottom) {
                if showCheckoutBtn {
                    Button(action: {
                        showCheckoutView = true
                    }, label: {
                        Text("Checkout")
                            .font(.title3)
                            .padding()
                                           .foregroundColor(.white)
                                           .frame(width: 250, height: 50)
                                           .background(Color.black)
                                           .cornerRadius(10)
                    }) .padding(.bottom, 10)

                        
                    
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
        .onAppear(){
            showCheckoutBtn = cartService.cart.items.count > 0 ? true : false
        }
        .onChange(of: cartService.cart.items.count) { _, newValue in
            showCheckoutBtn = newValue > 0 ? true : false
        }
    }
}
  

#Preview {
    struct Preview: View {
        @State var cartService: CartService?
        @State var showCheckoutBtn = true
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

