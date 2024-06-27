
import Foundation
import SwiftUI
@Observable
class CartService {
    var cart = CartModel()
    let cartAPIManager = CartAPIManager()
    

    func getCart() async throws {
        do {
            self.cart.items = try await cartAPIManager.getCart()
        }
        catch {
            print(error)
        }
    }
    func deleteFromCart(productId: String) async throws {
        do {
            self.cart.items = try await cartAPIManager.deleteFromCart(productId)
        }
        catch {
            print(error)
        }
    }

}
