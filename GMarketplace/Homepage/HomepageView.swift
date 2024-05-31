import SwiftUI

struct HomepageView: View {
    @State var catalog = [CatalogModel]()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            HeaderView(headerViewState: .full, path: $path)
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.adaptive(minimum: 180), spacing: 1),
                                         count: 2),spacing: 1) {
                    Section(header: SectionHeaderView()) {
                        ForEach(catalog, id: \.self) { product in
                            AsyncImage(url: URL(string: product.images?.first ?? "")) {
                                image in
                                ProductGridView(product: product, image: image)
                                .frame(width: 180, height: 240)
                                .padding(.top)
                                .onTapGesture {
                                    path.append(product)
                                }
                            }
                        placeholder: {
                            ProgressView()
                        }
                       }
                    }
                }
            }.background(.white)
                .padding(.top,20)
                .navigationDestination(for: CatalogModel.self) { selection in
                    ProductDetailsView(navigationPath: $path, product: selection)
                }
        }
        
        .task
        {
            self.catalog = await CatalogAPIManager().fetchCatalog(from: CatalogURL.getCatalog )
        }
    }
}

#Preview {
    HomepageView()
}
