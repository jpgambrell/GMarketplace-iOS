

import SwiftUI

struct CheckoutView: View {
   @Environment(\.dismiss) var dismiss
   @State var order: OrderSubmitModel
    
    var body: some View {
        VStack(){
            Button {
                dismiss()
            } label: {
                Text("Cancel").padding(20)
            }.containerRelativeFrame([.horizontal], alignment: .topTrailing)
            Spacer()
           
            List(){
                Section("Place your Order") {
                    VStack(alignment: .leading){
                        HStack{
                            Text("Subtotal:").font(.subheadline)
                            Spacer()
                            Text("\(order.subTotal.formatAsCurrency())").font(.subheadline)
                        }
                        HStack{
                            Text("Tax:").font(.subheadline)
                            Spacer()
                            Text("\(order.tax.formatAsCurrency())").font(.subheadline)
                        }
                        HStack{
                            Text("Order total:").font(.subheadline).bold()
                            Spacer()
                            Text("\(Double(order.subTotal + order.tax).formatAsCurrency())").font(.subheadline).bold().padding(.top)
                        }
                        
                        
                    }
                }
                Section("Payment") {
                    Text("Enter your credit card").font(.subheadline)
                }
                Section("Delivering to John Gambrell") {
                    VStack(alignment: .leading){
                        Text("123 Coolage St").font(.subheadline)
                        Text("Dallas, TX 75228").font(.subheadline)
                    }
                }
                
               
                Section("Arriving by July 24th") {
                    ForEach(self.order.items, id: \.self) {item in
                            OrderItemCellView(item: item)
                    }
                }
                
            }.padding(.bottom, 80)
           
        }
            //.sheet(isPresented: $showCheckoutView, content: {
//            CheckoutView(order: OrderSubmitModel(cart: cartService.cart))
//        })
        .overlay(alignment: .bottom) {
          //  if showCheckoutBtn {
                Button(action: {
                    //showCheckoutView = true
                }, label: {
                    Text("Pay")
                        .font(.title3)
                        .padding()
                                       .foregroundColor(.white)
                                       .frame(width: 250, height: 50)
                                       .background(Color.black)
                                       .cornerRadius(10)
                }) .padding(.bottom, 10)

                    
                
           // }
        }
    }
}

#Preview {
    struct Preview: View {
        var order: OrderSubmitModel = getOrderModel()
        var body: some View {
            CheckoutView(order: getOrderModel())
        }
    }
        func getOrderModel() -> OrderSubmitModel {

            
            let cart = CartModel()
           
                       // var items = [CartItem]()
         
           
            
            let order = OrderSubmitModel(cart: cart)
            return order
        }
    return Preview()
}
