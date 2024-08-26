
import Foundation
struct TokenModel : Codable {
	let accessToken : String?
	let idToken : String?
	let refreshToken : String?

	enum CodingKeys: String, CodingKey {

		case accessToken = "AccessToken"
		case idToken = "IdToken"
		case refreshToken = "RefreshToken"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
		idToken = try values.decodeIfPresent(String.self, forKey: .idToken)
		refreshToken = try values.decodeIfPresent(String.self, forKey: .refreshToken)
	}

}
