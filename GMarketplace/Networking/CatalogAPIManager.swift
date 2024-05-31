
import Foundation

enum CatalogURL: String {
    case getCatalog = "http://localhost:3000/catalog"
}


struct CatalogAPIManager {
   // func fetchCatalog(completion: @escaping (Result<[CatalogModel], Error>) -> Void) {
    func fetchCatalog(from url: CatalogURL) async -> [CatalogModel] {
//        guard  else {
//                   debugPrint("Invalid URL")
//                   return nil
//               }
        if  let url = URL(string: url.rawValue){
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                let catalog = try decoder.decode([CatalogModel].self, from: data)
                return catalog
                //                   DispatchQueue.main.async {
                //                      // self.users = users
                //                      // self.errorMessage = nil
                //                   }
            } catch {
                debugPrint("Failed to load data: \(error.localizedDescription)")
                
                //                   DispatchQueue.main.async {
                //                       self.errorMessage = "Failed to load data: \(error.localizedDescription)"
                //                   }
            }
        }
       return [CatalogModel]()
           }
//        guard let url = URL(string: "http://localhost:3000/catalog") else {
//            print("Invalid URL")
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let data = data else {
//                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
//                completion(.failure(error))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                let products = try decoder.decode([CatalogModel].self, from: data)
//                completion(.success(products))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        
//        task.resume()
    }



