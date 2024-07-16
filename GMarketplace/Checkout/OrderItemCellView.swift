//
//  OrderItemCellView.swift
//  GMarketplace
//
//  Created by John Gambrell on 7/16/24.
//

import SwiftUI

struct OrderItemCellView: View {
    var item: OrderItem
    var body: some View {
       
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: 10) {
                AsyncImage(url: URL(string: item.productImageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:50)
                    //.padding(10)
                } placeholder: {
                    ProgressView()
                }
                
                Text((item.productName))
                    .font(.subheadline)//.bold()
                    .lineLimit(3)
                   // .frame(width: .infinity)
                    .truncationMode(.tail)
                   // .padding()
                Spacer()
                Text("Qty: \(item.quantity)")
                    .font(.subheadline)
                    .padding(1)
                
                // Spacer()
                Text("\(item.price.formatAsCurrency())")
                    .font(.subheadline)
                    .padding(3)
                
            }
        }//.background(Color.gray.ignoresSafeArea().opacity(0.3))
            //.frame(width: .infinity)
            //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            //.padding(10)
    }
}

#Preview {
    OrderItemCellView(item: OrderItem(id: 1, productId: "123", productName: "Xbox Live Games so you like the way i do the thing", quantity: 2, price: 30.00, productImageURL: "https://media.gamestop.com/i/gamestop/11103843/Lite-Brite-Mini?$pdp2x$"))
}
