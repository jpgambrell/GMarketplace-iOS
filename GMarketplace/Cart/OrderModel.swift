//
//  OrderModel.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/21/24.
//

import SwiftUI
import Observation

@Observable class Order {
    var items = [CartItem]()

    var total: Double {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }

    func add(item: CartItem) {
        items.append(item)
    }

    func remove(item: CartItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
}
