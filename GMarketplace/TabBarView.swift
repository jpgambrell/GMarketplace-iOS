//
//  TabBarView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/17/24.
//

import SwiftUI

struct TabBarView: View {
    @State private var cart = CartModel()
    @State private var cartManager = CartAPIManager()
    var body: some View {
        TabView{
            HomepageView().tabItem {
                Label("Home", systemImage: "storefront")
            }
            CartView().tabItem {
                Label("Order", systemImage: "square.and.pencil")
                    
            }.environment(cart)
        }
        .task {
            do {
                self.cart.items =  try await cartManager.getCart()
                print("got cart")
            }
            catch {
                
            }
        }
    }
}

#Preview {
    TabBarView().environment(CartModel())
}
