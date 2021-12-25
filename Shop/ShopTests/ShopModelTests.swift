@testable import Shop
import XCTest

// Shop Model tests
//
// The goal of those tests are to check your Model decoding.
// You can use the two linked json files to help you achieve those tests.
// Hint: Bundle, Data

// Fill up those already created methods.
class ShopModelTests: XCTestCase {

    var bundle = Bundle(for: NetworkManagerTests.self)

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testModelDecodingFromJSONFileShouldParseWithSuccess() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        guard let resource = bundle.url(forResource: "Shop", withExtension: "json") else {
            XCTFail()
            return
        }
        guard let data = try? Data(contentsOf: resource) else {
            XCTFail()
            return
        }
        guard let shopJSON = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String : Any] else {
            XCTFail()
            return
        }
        let name = shopJSON["company_name"] as? String
        guard let products = shopJSON["products"] as? [Any] else {
            XCTFail()
            return
        }
        let nbProducts = products.count
        let product = products[0] as? [String : Any]
        let id = product?["id"] as? String
        
        XCTAssert(name == "Savon de France")
        XCTAssert(nbProducts == 8)
        XCTAssert(id == "aloe-vera-bar")
        // Get data from resource
        // Parse it
        // Asserts: Verify the company name, the number of products, values of the first element.
        // TODO: Assert
    }

    func testMalformedDataDecodingFromJSONFileShouldParseWithFailure() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        guard let resource = bundle.url(forResource: "MalformedShop", withExtension: "json") else {
            XCTFail()
            return
        }

        // Get data from resource
        // Parse it
        // Verify that decoding is failing and returning nil
        // TODO: Assert
    }
}
