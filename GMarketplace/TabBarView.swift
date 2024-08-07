//
//  TabBarView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/17/24.
//

import SwiftUI

struct TabBarView: View {
    @Environment(CartService.self) var cartService
    var body: some View {
        TabView{
            HomepageView().tabItem {
                Label("Home", systemImage: "storefront")
            }
            CartView().tabItem {
                Label("Cart", systemImage: "square.and.pencil")
                    
            }.badge(cartService.cart.items.count)
        }
        .task {
            do {
                try await cartService.getCart(cartBy: .user_id, id: 1)
            }
            catch {
                
            }
        }
    }
}

#Preview {
    TabBarView().environment(CartService())
}
