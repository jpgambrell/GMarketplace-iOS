
import SwiftUI
import UIKit

@main
struct GMarketplaceApp: App {
    @StateObject var cart = CartModel().createMockCart()
    var body: some Scene {
        WindowGroup {
            TabBarView().environmentObject(cart)
        }
    }
       
}



extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.isHidden = true
    }
}
