

import Foundation
enum CartURL: String {
    case getCart = "http://localhost:3000/cart"
    case addToCart = "http://localhost:3000/addToCart"
}
struct AddToCartBody: Codable {
    let product_id : String
    let product_name: String
    let quantity: Int
    let price: Double
}

struct AddtoCartResp: Codable {
    let rowCount: Int
    let command: String
}

struct CartAPIManager: URLSessionTasks {
    func getCart() async throws -> [CartItem] {
        let cartItems:[CartItem] = try await getRequestArray(endpoint: CartURL.getCart.rawValue)
        return cartItems
    }
    func addToCart(productId: String, productName: String, quantity: Int, price: Double) async throws -> AddtoCartResp{
        let body = AddToCartBody(product_id: productId, product_name: productName, quantity: quantity, price: price)
        let cart:AddtoCartResp = try await postRequest(endpoint: CartURL.addToCart.rawValue, input: body )
        return cart
    }
}
