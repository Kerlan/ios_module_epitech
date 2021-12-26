import Foundation

// Excercise: Create a caching strategy to save up the quantity of your products
//
// Feel free to use any kind of caching strategy from Apple own frameworks.
// Explain why you went for this implementation and be ready to explain the difference
// between your caching strategy vs others.
protocol CacheManaging {
    func save<T: Codable>( value: T?, forKey key: String)
    func value<T: Codable>(forKey key: String, type: T.Type) -> T?
}

class CacheManager: CacheManaging {

    func save<T: Codable>( value: T?, forKey key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
    }

    func value<T: Codable>(forKey key: String, type: T.Type) -> T? {
        guard let value = UserDefaults.standard.object(forKey: key) as? T else {
            return nil
        }
        return value
    }
}
