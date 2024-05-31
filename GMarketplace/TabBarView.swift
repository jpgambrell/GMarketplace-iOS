//
//  TabBarView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/17/24.
//

import SwiftUI

struct TabBarView: View {
    @Environment(CartModel.self) private var cart
    var body: some View {
        TabView{
            HomepageView().tabItem {
                Label("Home", systemImage: "storefront")
            }
            CartView().tabItem {
                Label("Order", systemImage: "square.and.pencil")
            }
        }
    }
}

#Preview {
    TabBarView().environment(CartModel().createMockCart())
}
