
import SwiftUI
import UIKit

@main
struct GMarketplaceApp: App {
   // @State var cart = CartModel()//.createMockCart()
    @State private var cartService = CartService()
    var body: some Scene {
        WindowGroup {
            TabBarView().environment(cartService)
        }
    }
       
}


//TODO: move these extensions to a better place

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.isHidden = true
    }
}
extension Double {
    func formatAsCurrency(locale: Locale = Locale.current) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        if let formattedString = formatter.string(from: NSNumber(value: self)) {
            return formattedString
        } else {
            return ""
        }
    }
}
