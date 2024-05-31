
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
 public init(average_rating: Double, sub_category: String, category: String, images: [String], brand: String, specs: String, price: Double, description: String, id: String, name: String, sku: String, availability: String){
        self.average_rating = average_rating
        self.sub_category = sub_category
        self.category = category
        self.images = images
        self.brand = brand
        self.specs = specs
        self.price = price
        self.description = description
        self.id = id
        self.name = name
        self.sku = sku
        self.availability = availability
        
    }
//    mutating func createMockProduct()-> CatalogModel {
//         average_rating = 2.0
//         sub_category = "Mens"
//         category = "Clothing"
//         images = ["https://media.gamestop.com/i/gamestop/11143293/Honu-Turtle-Hawaiian-Islands-Word-Art-Womens-Premium-Blend-T-Shirt?$pdp2x$"]
//         brand = "Gap"
//         specs = ""
//         price = 20.40
//         description = "The Show is back! MLB The Show brings you the best of baseball. Play America's pastime your way, with new game modes, expanded team building and player customization, and an extensive personalized RPG experience. Create your own player and rise through the MLB ranks or play against others as baseball's greatest stars and legends. Fierce online competition*, exciting RPG action, lightning fast gameplay‚Äì‚ÄìThe Show 19 has it all. This is more than baseball. Welcome to The Show.      New Game Mode: Moments.  Recreate or change some of the biggest moments in baseball history**New Unannounced Game Mode: March to October.New in Road to The Show: deeper RPG elements, more ways to improve your player on and off the field, and the removal of level caps.New in Diamond Dynasty**: more streamlined mission and reward systems and numerous new quality-of-life improvements make earning rewards faster and clearer than previous years.Conquer and defend territories in new Conquest maps, designed to provide a more dynamic and reward-filled Conquest experience."
//         id = "12332112"
//         name = "Cool Shirt"
//         sku = "123"
//         availability = "IN STOCK"
//        
//        return self
//     }

}
