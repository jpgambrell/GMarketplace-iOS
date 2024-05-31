//
//  HomepageView.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/14/24.
//

import SwiftUI

struct HomepageView: View {
    @State var catalog = [CatalogModel]()
    //@State private var showDetails = false
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            HeaderView()
                //.padding(.bottom,120)
                .frame(height:75)
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.adaptive(minimum: 180), spacing: 1),
                        count: 2),spacing: 1) {
                    
                    ForEach(catalog, id: \.self) { product in
                        AsyncImage(url: URL(string: product.images?.first ?? "")) {
                            image in
                            VStack{
                                image
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .clipShape(.rect(cornerRadius: 5))
                                VStack(alignment: .leading){
                                    Text(product.name ?? "")
                                        .font(.callout)
                                    Text("$\(String(describing:product.price ?? 0.0))")
                                        .font(.headline)
                                }
                                .padding([.leading, .trailing, .bottom])
                            }
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
            }.background(.white)
                .padding(.top,20)
            .navigationDestination(for: CatalogModel.self) { selection in
                    ProductDetailsView(product: selection)
                }
            
        }
        .task {
            CatalogAPIManager().fetchCatalog { result in
                switch result {
                case .success(let catalog):
                    self.catalog = catalog
                case .failure(let error):
                    print("Failed to fetch users: \(error.localizedDescription)")
                }
            }
        }
    }
    
}


#Preview {
    HomepageView()
}
