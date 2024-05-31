import Foundation

class CartModel: ObservableObject/*: Codable, Identifiable, Hashable*/ {
    var id = ""
    var merchant = ""
    var items = [CartItem]()

    func createMockCart() -> CartModel{
        var items = [CartItem]()
        items.append(CartItem(productId: "111", productName: "MLB The Show 2024", quantity: 1, price: 63.33))
        items.append(CartItem(productId: "222", productName: "Pophead Mojo", quantity: 1, price: 32.45))
        items.append(CartItem(productId: "333", productName: "XBox Bone", quantity: 1, price: 383.13))
        
        self.id = "3432423"
        self.merchant = "Game Palace"
        self.items = items
        return self
    }
}

struct CartItem {
    var productId: String
    var productName: String
    var quantity: Int
    var price: Double
}
