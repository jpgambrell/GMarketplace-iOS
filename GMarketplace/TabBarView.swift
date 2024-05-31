//
//  TabBarView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/17/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            HomepageView().tabItem {
                Label("Menu", systemImage: "list.dash")
            }
            CartView().tabItem {
                Label("Order", systemImage: "square.and.pencil")
            }
        }
    }
}

#Preview {
    TabBarView()
}
