

import Foundation
protocol URLSessionTasks {
    func postRequest<Input: Codable, Output: Codable>(endpoint: String, input: Input) async throws -> Output
    func getRequestArray<Output: Codable>(endpoint:String) async throws -> [Output]
    func getRequest<Output: Codable>(endpoint:String) async throws -> Output
}
extension URLSessionTasks {
    func getRequest<Output: Codable>(endpoint:String) async throws -> Output {

            if  let url = URL(string: endpoint){
                
                do {
                    let (data, resp) = try await URLSession.shared.data(from: url)
                    
                    print("resp: \(resp.description)")
                    
                    let decoder = JSONDecoder()
                    let catalog : Output = try decoder.decode(Output.self, from: data)
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
        return Output.self as! Output
    }
    func getRequestArray<Output: Codable>(endpoint:String) async throws -> [Output] {
        if  let url = URL(string: endpoint){
            
            do {
                let (data, resp) = try await URLSession.shared.data(from: url)
                
                print("resp: \(resp.description)")
                
                let decoder = JSONDecoder()
                let catalog : [Output] = try decoder.decode([Output].self, from: data)
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
        return [Output]() 
    }
    
    func postRequest<Input: Codable, Output: Codable>(endpoint: String, input: Input) async throws -> Output {
        // Step 1: Create the URL from the endpoint string
        guard let url = URL(string: endpoint) else {
            throw URLError(.badURL)
        }
        
        // Step 2: Create a URLRequest and configure it for POST
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Step 3: Set the request's content type to JSON
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Step 4: Encode the input struct to JSON and set the HTTP body
        do {
            let jsonData = try JSONEncoder().encode(input)
            request.httpBody = jsonData
        } catch {
            throw error
        }
        
        // Step 5: Perform the request using URLSession and await the result
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Step 6: Check the response and return the decoded output struct
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            throw URLError(URLError.Code(rawValue: statusCode))
        }
        
        // Step 7: Decode the response data to the output struct
        do {
            let output = try JSONDecoder().decode(Output.self, from: data)
            return output
        } catch {
            throw error
        }
    }
}
//    // Example usage:
//    
//    // Define input and output structs
//    struct ExampleInput: Codable {
//        let key1: String
//        let key2: String
//    }
//    
//    struct ExampleOutput: Codable {
//        let result: String
//    }
//    
//    // Function to call the generic postRequest function
//    @main
//    struct MyApp {
//        static func main() async {
//            let endpoint = "https://example.com/api/v1/resource"
//            let input = ExampleInput(key1: "value1", key2: "value2")
//            
//            do {
//                let output: ExampleOutput = try await postRequest(endpoint: endpoint, input: input)
//                print("Output received: \(output)")
//            } catch {
//                print("Error occurred: \(error)")
//            }
//        }
//    }
//}
