import Foundation

enum ShopURL {
    static var home = "https://api.npoint.io/c905fd4932fa5fd53b0e"
    static var malformatedHome = "https://api.npoint.io/1d02702b67d713482892"
}

// Excercise: Create a API handler that has a `fetchShop` method.
// The endpoint for the fetchShop API is `ShopURL.home`
protocol APIHandling {
    func fetchShop(completion: ((Result<Shop, NetworkError>) -> Void)?)
}

class APIHandler: APIHandling {

    let networkManager: NetworkManaging

    init(networkManager: NetworkManaging) {
        self.networkManager = networkManager
    }

    func fetchShop(completion: ((Result<Shop, NetworkError>) -> Void)?) {
        networkManager.data(from: URL(string: ShopURL.home)!, type: Shop.self) { result in
            switch result {
            case let .success(data):
                completion!(.success(data))
            case let .failure(error):
                completion!(.failure(error))
            }
        }
    }
}
