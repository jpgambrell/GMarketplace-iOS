

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
                
                //Section("Checkout") {
                    ForEach(self.order.items, id: \.self) {item in
                            OrderItemCellView(item: item)
                    }
                //}
            }
            
        }
    }
}

//#Preview {
//    CheckoutView(order: OrderSubmitModel())
//}
