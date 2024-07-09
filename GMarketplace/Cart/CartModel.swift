import UIKit
@Observable
class CartModel : Codable {
    let id : Int
    let userId : Int?
    let items : [CartItem]?
    var total: Double {
        guard let items = items else {return 0}
        if items.count > 0 {
                return items.reduce(0) { $0 + $1.price }
            } else {
                return 0
            }
        }

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case userId = "user_id"
        case items = "items"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        items = try values.decodeIfPresent([CartItem].self, forKey: .items)
    }

}

struct CartItem : Codable, Identifiable {
    let id : Int
    let productId : String?
    let productName : String?
    let quantity : Int?
    let price : Double
    let productImageURL : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case productId = "product_id"
        case productName = "product_name"
        case quantity = "quantity"
        case price = "price"
        case productImageURL = "product_image_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id) ?? 0
        productId = try values.decodeIfPresent(String.self, forKey: .productId)
        productName = try values.decodeIfPresent(String.self, forKey: .productName)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        price = try values.decodeIfPresent(Double.self, forKey: .price) ?? 0
        productImageURL = try values.decodeIfPresent(String.self, forKey: .productImageURL)
    }

}


//
//@Observable class CartModel {
//    var id = ""
//    //var merchantCarts = [MerchantCart]()
//    var items = [CartItem]()
//    var total: Double {
//        if items.count > 0 {
//            return items.reduce(0) { $0 + $1.price }
//        } else {
//            return 0
//        }
//    }
//
////    func add(item: CartItem) {
////        items.append(item)
////    }
////
////    func remove(item: CartItem) {
////        if let index = items.firstIndex(of: item) {
////            items.remove(at: index)
////        }
////    }
////    
//    func createMockCart() -> CartModel{
//        var items = [CartItem]()
//        items.append(CartItem(id: 333, productId: "111", productName: "MLB The Show 2024", quantity: 1, price: 63.33, productImageURL: "https://media.gamestop.com/i/gamestop/11103843/Lite-Brite-Mini?$pdp2x$"))
//        items.append(CartItem(id: 3334,productId: "222", productName: "Pophead Mojo", quantity: 1, price: 32.45, productImageURL: ""))
//        items.append(CartItem(id: 4444,productId: "333", productName: "XBox Bone", quantity: 1, price: 383.13, productImageURL: ""))
//        self.items = items
//        return self
//    }
//}
//
//
////struct MerchantCart: Codable, Identifiable, Hashable {
////    var id = ""
////    var merchant = ""
////    var items = [CartItem]()
////}
//
//struct CartItem: Codable, Equatable, Identifiable {
//        let id : Int?
//        let productId : String?
//        let quantity : Int?
//        let price : Double
//        let updatedDate : String?
//        let productName : String?
//        let productImageURL: String?
//
//        enum CodingKeys: String, CodingKey {
//            case id = "id"
//            case productId = "product_id"
//            case quantity = "quantity"
//            case price = "price"
//            case updatedDate = "update_dt"
//            case productName = "product_name"
//            case productImageURL = "product_image_url"
//        }
//    
//    init(id: Int, productId: String, productName: String, quantity: Int, price: Double, productImageURL: String) {
//        self.id = id
//        self.productId = productId
//        self.productName = productName
//        self.quantity = quantity
//        self.price = price
//        self.updatedDate = "2024-06-27 16:04:40.184926"
//        self.productImageURL = productImageURL
//    }
//
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            id = try values.decodeIfPresent(Int.self, forKey: .id)
//            productId = try values.decodeIfPresent(String.self, forKey: .productId)
//            quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
//            price = try values.decodeIfPresent(Double.self, forKey: .price) ?? 0.0
//            updatedDate = try values.decodeIfPresent(String.self, forKey: .updatedDate)
//            productName = try values.decodeIfPresent(String.self, forKey: .productName)
//            productImageURL = try values.decodeIfPresent(String.self, forKey: .productImageURL)
//        }
//}
