//
//  CatalogAPIManager.swift
//  GMarketplace
//
//  Created by John Gambrell on 5/14/24.
//

import Foundation


struct CatalogAPIManager {
    func fetchCatalog(completion: @escaping (Result<[CatalogModel], Error>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/catalog") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([CatalogModel].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}


