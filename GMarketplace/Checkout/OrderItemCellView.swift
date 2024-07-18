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
            HStack(alignment: .top, spacing: 0) {
                AsyncImage(url: URL(string: item.productImageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height:50)
                    //.padding(5)
                } placeholder: {
                    ProgressView()
                }
                
                Text((item.productName))
                    .font(.subheadline)//.bold()
                    .lineLimit(3)
                    .truncationMode(.tail)
                    .padding(.leading,5)
                Spacer()
                Text("Qty: \(item.quantity)")
                    .font(.subheadline)
                   // .padding(1)
                
                // Spacer()
                Text("\(item.price.formatAsCurrency())")
                    .font(.subheadline)
                    .padding(.leading, 3)
                
            }
        }
    }
}

#Preview {
    OrderItemCellView(item: OrderItem(id: 1, productId: "123", productName: "Xbox Live Games so you like the way i do the thing", quantity: 2, price: 30.00, productImageURL: "https://media.gamestop.com/i/gamestop/11103843/Lite-Brite-Mini?$pdp2x$"))
}
