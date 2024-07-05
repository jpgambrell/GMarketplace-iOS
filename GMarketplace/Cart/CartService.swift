
import Foundation
import SwiftUI
@Observable
class CartService {
    var cart : CartModel?
    let cartAPIManager = CartAPIManager()
    

    func getCart() async throws {
        do {
           // self.cart.items = try await cartAPIManager.getCart()
            self.cart = try await cartAPIManager.getCart()
        }
        catch {
            print(error)
        }
    }
    func deleteFromCart(productId: String) async throws {
        do {
            self.cart = try await cartAPIManager.deleteFromCart(productId)
        }
        catch {
            print(error)
        }
    }
    func updateCart(productId: String, quantity: Int) async throws {
        do {
            self.cart = try await cartAPIManager.updateCart(productId: productId, quantity: quantity)
        }
        catch {
            print(error)
        }
    }

}
