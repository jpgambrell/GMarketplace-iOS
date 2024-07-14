
import Foundation
import SwiftUI
@Observable
class CartService {
    var cart : CartModel = CartModel()
    let cartAPIManager = CartAPIManager()
    

    func getCart(cartBy: GetCartBy, id: Int) async throws {
        do {
            self.cart = try await cartAPIManager.getCart(cartBy: cartBy, id: id)
        }
        catch {
            print(error)
        }
    }
    func deleteFromCart(cartId: Int, productId: String) async throws {
        do {
            self.cart = try await cartAPIManager.deleteFromCart(cartId: cartId, productId: productId)
        }
        catch {
            print(error)
        }
    }
    func updateCart(cartId: Int, productId: String, quantity: Int) async throws {
        do {
            self.cart = try await cartAPIManager.updateCart(cartId: cartId, productId: productId, quantity: quantity)
        }
        catch {
            print(error)
        }
    }
    func submitOrder(cartId: Int) async throws {
        do {
            self.cart = try await cartAPIManager.submitOrder(cartId: cartId)
        }
        catch {
            print(error)
        }
    }

}
