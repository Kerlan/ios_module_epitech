import Foundation

// TODO: Create the data models
// Check out the API specs on Shop.json 

struct Shop: Codable {
    var name: String
    var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case name = "company_name"
        case products
    }
}

struct Product: Codable {
    var id: String
    var name: String
    var image: String
    var priceCents: Int
    var currency: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case priceCents = "price_cents"
        case currency
    }
}
