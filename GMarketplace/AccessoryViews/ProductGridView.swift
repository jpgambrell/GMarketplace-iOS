import SwiftUI

struct ProductGridView: View {
    var product: CatalogModel?
    var image: Image?
    
    init(product: CatalogModel? = nil, image: Image? = nil) {
        self.product = product
        self.image = image
    }
    
    
    var body: some View {
        VStack{
            image?
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(.rect(cornerRadius: 5))
            VStack(alignment: .leading){
                Text(product?.name ?? "")
                    .font(.callout)
                Text("$\(String(describing:product?.price ?? 0.0))")
                    .font(.headline)
            }
            .padding([.leading, .trailing, .bottom])
        }
    }
}

#Preview {
    ProductGridView()
}
