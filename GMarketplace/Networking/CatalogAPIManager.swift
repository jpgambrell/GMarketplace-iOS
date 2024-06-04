
import Foundation

enum CatalogURL: String {
   // case getCatalog = "http://192.168.0.126:3000/catalog"
    case getCatalog = "http://localhost:3000/catalog"
}


struct CatalogAPIManager: URLSessionTasks {
    func getCatalog() async throws -> [CatalogModel] {
        let catalog: [CatalogModel] = try await getRequestArray(endpoint: CatalogURL.getCatalog.rawValue)
        return catalog
    }
    
    
    }



