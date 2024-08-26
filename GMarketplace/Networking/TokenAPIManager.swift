
import Foundation

enum AuthURL: String {
    case signUp = "http://localhost:3000/signup"
    case login = "http://localhost:3000/login"
    case refresh = "http://localhost:3000/refresh"
}
struct AuthBody : Codable {
    let user_name: String
    let password: String
}

struct RefreshBody : Codable {
    let refreshToken: String
}

struct TokenAPIManager: URLSessionTasks {
    func login(userName: String, password: String) async throws -> TokenModel {
        let body = AuthBody(user_name: userName, password: password)
        let token: TokenModel = try await postRequest(endpoint: AuthURL.login.rawValue, input: body)
        return token
    }
    
    func signUp(userName: String, password: String) async throws -> TokenModel {
        let body = AuthBody(user_name: userName, password: password)
        let token: TokenModel = try await postRequest(endpoint: AuthURL.signUp.rawValue, input: body)
        return token
    }
    
    func refresh(refreshToken: String) async throws -> TokenModel {
        let body = RefreshBody(refreshToken: refreshToken)
        let token: TokenModel = try await postRequest(endpoint: AuthURL.refresh.rawValue, input: body)
        return token
    }
    
}
