//
//  HeaderView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/14/24.
//

import SwiftUI

struct HeaderView: View {
    @State var searchText: String = ""
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                TextField("Search...", text: $searchText)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color(.systemGray6)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .font(.system(size: 18))
            }
            .padding(.top, 60)
            HStack(alignment: .bottom){
                Image(systemName: "mappin.and.ellipse")
                Text("Deliver to John - Sunnyvale, TX")
                    .font(.callout)
                 Spacer()
            }
           
            .padding(.bottom,20)
            .padding(.top,5)
            
            
           Spacer()
        }
        .padding(.horizontal, 20)
        .background(.orange.opacity(0.7))
        //.padding(.top,0)
       
    }
}

#Preview {
    HeaderView()
}
