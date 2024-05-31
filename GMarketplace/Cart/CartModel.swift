import Foundation
class CartModel: ObservableObject {
    var id = ""
    var merchantCarts = [MerchantCart]()
    
    func createMockCart() -> CartModel{
        var items = [CartItem]()
        items.append(CartItem(id: "32423", productId: "111", productName: "MLB The Show 2024", quantity: 1, price: 63.33))
        items.append(CartItem(id: "36623",productId: "222", productName: "Pophead Mojo", quantity: 1, price: 32.45))
        items.append(CartItem(id: "37723",productId: "333", productName: "XBox Bone", quantity: 1, price: 383.13))
        
        var merch = MerchantCart()
        merch.id = "3424"
        merch.merchant = "Gaming Palace"
        merch.items = items
        
        
        self.id = "3432423"
        self.merchantCarts.append((merch))
        return self
    }
}


struct MerchantCart: Codable, Identifiable, Hashable {
    var id = ""
    var merchant = ""
    var items = [CartItem]()
}

struct CartItem: Codable, Hashable, Identifiable {
    var id: String
    var productId: String
    var productName: String
    var quantity: Int
    var price: Double
}
