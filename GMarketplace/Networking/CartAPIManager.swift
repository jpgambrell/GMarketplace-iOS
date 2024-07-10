

import Foundation
enum CartURL: String {
    case getCart = "http://localhost:3000/cart"
    case addToCart = "http://localhost:3000/addToCart"
    case updateCart =  "http://localhost:3000/updateCart"
    case deleteFromCart = "http://localhost:3000/deleteFromCart"
}
struct AddToCartBody: Codable {
    let cart_id: Int
    let product_id : String
    let product_name: String
    let quantity: Int
    let price: Double
    let image: String
}

struct UpdateCartBody: Codable {
    let cart_id: Int
    let product_id : String
    let quantity: Int
}

struct EmptyStruct: Codable{
   // var test: String = ""
}

struct AddtoCartResp: Codable {
    let rowCount: Int
    let command: String
}

struct CartAPIManager: URLSessionTasks {
    func getCart() async throws -> CartModel {
        let cartItems:CartModel = try await getRequest(endpoint: CartURL.getCart.rawValue)
        return cartItems
    }
    
    func addToCart(cartId: Int, productId: String, productName: String, quantity: Int, price: Double, productImageURL: String) async throws -> CartModel{
        do {
            let body = AddToCartBody(cart_id: cartId, product_id: productId, product_name: productName, quantity: quantity, price: price, image: productImageURL)
            let cart:CartModel  = try await postRequest(endpoint: CartURL.addToCart.rawValue, input: body )
            
            return cart
        }
        catch{
                print(error)
            throw error
        }
    }
    
    func updateCart(cartId:Int, productId: String, quantity: Int) async throws -> CartModel{
        do {
            let body = UpdateCartBody(cart_id: cartId, product_id: productId,  quantity: quantity)
            let cart:CartModel = try await postRequest(endpoint: CartURL.updateCart.rawValue, input: body)
            
            return cart
        }
        catch{
                print(error)
            throw error
        }
    }
    
    func deleteFromCart(cartId:Int, productId: String) async throws -> CartModel{
        do {
            //TODO better URL composing with path params
            let cart:CartModel = try await postRequest(endpoint: "\(CartURL.deleteFromCart.rawValue)/\(cartId)/\(productId)")
            return cart
        }
        catch{
                print(error)
            throw error
        }
    }
    
  
}
