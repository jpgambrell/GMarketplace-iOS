import Foundation

@Observable class CartModel: Codable {
    var id = ""
    //var merchantCarts = [MerchantCart]()
    var items = [CartItem]()
    var total: Double {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price }
        } else {
            return 0
        }
    }

//    func add(item: CartItem) {
//        items.append(item)
//    }
//
//    func remove(item: CartItem) {
//        if let index = items.firstIndex(of: item) {
//            items.remove(at: index)
//        }
//    }
//    
//    func createMockCart() -> CartModel{
//        var items = [CartItem]()
//        items.append(CartItem(id: UUID(), productId: "111", productName: "MLB The Show 2024", quantity: 1, price: 63.33))
//        items.append(CartItem(id: UUID(),productId: "222", productName: "Pophead Mojo", quantity: 1, price: 32.45))
//        items.append(CartItem(id: UUID(),productId: "333", productName: "XBox Bone", quantity: 1, price: 383.13))
//        
////        var merch = MerchantCart()
////        merch.id = "3424"
////        merch.merchant = "Gaming Palace"
////        merch.items = items
////        
////        
////        self.id = "3432423"
////        self.merchantCarts.append((merch))
//        return self
//    }
}


//struct MerchantCart: Codable, Identifiable, Hashable {
//    var id = ""
//    var merchant = ""
//    var items = [CartItem]()
//}

struct CartItem: Codable, Hashable, Identifiable {
//    var id: UUID
//    var productId: String
//    var productName: String
//    var quantity: Int
//    var price: Double
    
        let id : Int?
        let productId : String?
        let quantity : Int?
        let price : Double
        let createdDate : String?
        let productName : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case productId = "product_id"
            case quantity = "quantity"
            case price = "price"
            case createdDate = "created_dt"
            case productName = "product_name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            productId = try values.decodeIfPresent(String.self, forKey: .productId)
            quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
            price = try values.decodeIfPresent(Double.self, forKey: .price) ?? 0.0
            createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
            productName = try values.decodeIfPresent(String.self, forKey: .productName)
        }
}
