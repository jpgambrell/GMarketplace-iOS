
import Foundation

enum CatalogURL: String {
   // case getCatalog = "http://192.168.0.126:3000/catalog"
    case getCatalog = "http://localhost:3000/catalog"
}


struct CatalogAPIManager: URLSessionTasks {
    func getCatalog(endpoint: CatalogURL) async throws -> [CatalogModel] {
        
        let output: [CatalogModel] = try await getRequestArray(endpoint: endpoint.rawValue)
        return output
    }
    
    
    }



