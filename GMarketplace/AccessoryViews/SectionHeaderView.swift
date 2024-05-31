//
//  SectionHeaderView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/15/24.
//

import SwiftUI

struct SectionHeaderView: View {
    var body: some View {
        //VStack(alignment: .leading){
            HStack(alignment: .bottom) {
                Text("Hot Items")
                    .font(.title)
                Spacer()
            }.padding([.top, .leading, .trailing])
            .frame(height: 40)
           // .background(.red)
         //   Spacer()
        //}
    }
}

#Preview {
    SectionHeaderView()
}
