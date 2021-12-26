@testable import Shop
import XCTest

// Cache manager tests
//
// The goal of those tests are to check your cache implementation (eg: saving or retrieving data)
// Fill up those already created methods.
class CacheManagerTests: XCTestCase {

    let cacheManager = CacheManager()
    let key = "Test_Key"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // Don't forget to delete / rewrite your data on the specific test key each time you run a test to avoid false negatives
    }

    func testSaveMockSuccessful() throws {
            // This is an example of a functional test case.
            // Use XCTAssert and related functions to verify your tests produce the correct results.

            // TODO: Assert
            cacheManager.save(value: 2, forKey: key)
            guard let _ = cacheManager.value(forKey: key, type: Int.self) else {
                XCTFail()
                return
            }
            XCTAssert(true)
        }

        func testGetMockFailure() throws {
            // TODO: Assert
            let nb = 3
            cacheManager.save(value: nb, forKey: key)
            guard let value = cacheManager.value(forKey: key, type: Int.self) else {
                XCTFail()
                return
            }
            XCTAssert(value == nb)
        }
}
