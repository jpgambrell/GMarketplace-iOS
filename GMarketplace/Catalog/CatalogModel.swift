
import Foundation
struct CatalogModel : Codable, Identifiable, Hashable {
	let average_rating : Double?
	let sub_category : String?
	let category : String?
	let images : [String]?
	let brand : String?
	let specs : String?
	let price : Double?
	let description : String?
	let id : String?
	let name : String?
	let sku : String?
	let availability : String?

	enum CodingKeys: String, CodingKey {

		case average_rating = "average_rating"
		case sub_category = "sub_category"
		case category = "category"
		case images = "images"
		case brand = "brand"
		case specs = "specs"
		case price = "price"
		case description = "description"
		case id = "id"
		case name = "name"
		case sku = "sku"
		case availability = "availability"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		average_rating = try values.decodeIfPresent(Double.self, forKey: .average_rating)
		sub_category = try values.decodeIfPresent(String.self, forKey: .sub_category)
		category = try values.decodeIfPresent(String.self, forKey: .category)
		images = try values.decodeIfPresent([String].self, forKey: .images)
		brand = try values.decodeIfPresent(String.self, forKey: .brand)
		specs = try values.decodeIfPresent(String.self, forKey: .specs)
		price = try values.decodeIfPresent(Double.self, forKey: .price)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		sku = try values.decodeIfPresent(String.self, forKey: .sku)
		availability = try values.decodeIfPresent(String.self, forKey: .availability)
	}

}
