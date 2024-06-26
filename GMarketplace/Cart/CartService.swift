
import Foundation
import SwiftUI
@Observable
class CartService {
    var cart = CartModel()
    let cartAPIManager = CartAPIManager()
    
//    public init(){
//        
//    }
    func getCart() async throws {
        do {
            self.cart.items = try await cartAPIManager.getCart()
        }
        catch {
            print(error)
        }
    }
    func deleteFromCart() async throws {
        do {
            self.cart.items = try await cartAPIManager.deleteFromCart()
        }
        catch {
            print(error)
        }
    }

}
