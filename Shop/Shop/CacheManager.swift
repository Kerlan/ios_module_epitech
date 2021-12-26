import Foundation

// Excercise: Create a caching strategy to save up the quantity of your products
//
// Feel free to use any kind of caching strategy from Apple own frameworks.
// Explain why you went for this implementation and be ready to explain the difference
// between your caching strategy vs others.
protocol CacheManaging {
    func save<T: Codable>(_ value: T?, forKey key: String)
    func value<T: Codable>(forKey key: String, type: T.Type) -> T?
}

class CacheManager: CacheManaging {

    func save<T: Codable>(_ value: T?, forKey key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
    }

    func value<T: Codable>(forKey key: String, type: T.Type) -> T? {
        guard let data = UserDefaults.standard.object(forKey: key) as? Data else {
            return nil
        }
        guard let object = try? JSONDecoder().decode(type, from: data) else {
            return nil
        }
        return object
    }
}
