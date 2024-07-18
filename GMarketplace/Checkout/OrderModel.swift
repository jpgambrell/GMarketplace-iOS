import Foundation

@Observable
class OrderSubmitModel : Identifiable, Hashable {
    var id = UUID()
    let items : [OrderItem]
    let subTotal: Double
    
    var tax: Double {
        return 0.10 * subTotal
    }
    
    let status: String
    let userId: Int
    let paymentMethod: String
    let cartId: Int
    
    init(id: UUID = UUID(), items: [CartItem], subTotal: Double = 0, status: String = "PENDING", userId: Int, paymentMethod: String, cartId: Int) {
        self.id = id
        self.subTotal = subTotal
        self.status = status
        self.userId = userId
        self.paymentMethod = paymentMethod
        self.cartId = cartId
        self.items = items.map { item in
            return OrderItem(id: item.id, productId: item.productId, productName: item.productName, quantity: item.quantity, price: item.price, productImageURL: item.productImageURL)
        }
        
    }
    
    init(cart: CartModel) {
        self.id = UUID()
        self.subTotal = cart.subTotal
       // self.tax = cart.total * 0.85
        self.status = "PENDING"
        self.userId = cart.userId
        self.paymentMethod = ""
        self.cartId = cart.id
        self.items = cart.items.map { item in
            return OrderItem(id: item.id, productId: item.productId, productName: item.productName, quantity: item.quantity, price: item.price, productImageURL: item.productImageURL)
        }
        
    }
    //TODO fix these protocal funcs
    static func == (lhs: OrderSubmitModel, rhs: OrderSubmitModel) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func populateOrderItems(items: [CartItem]) -> [OrderItem] {
        let orderItems: [OrderItem] = items.map { item in
            return OrderItem(id: item.id, productId: item.productId, productName: item.productName, quantity: item.quantity, price: item.price, productImageURL: item.productImageURL)
        }
        return orderItems
    }
}

struct OrderItem : Identifiable, Hashable {
    let id : Int
    let productId : String
    let productName : String
    let quantity : Int
    let price : Double
    let productImageURL : String
}
