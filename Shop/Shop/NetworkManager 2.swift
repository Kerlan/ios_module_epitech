import Foundation

enum NetworkError: Error, Equatable {
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.noData, .noData):
            return true
        case (let .error(error1), let error(error2)):
            return error1.localizedDescription == error2.localizedDescription
        case (.malformedData, .malformedData):
              return true
        default:
            return false
        }
    }

    case noData
    case error(Error)
    case malformedData
}

// Excercise: Create a networking manager to fetch data from an API endpoint
//
// Requirement:
// - Use URLSession for this excercise.
// - Return a NetworkError if error occurs or not data.
//
// Hint: Decodable, URLSession, URLSessionConfiguration, Decoder
protocol NetworkManaging {
    func data<T: Decodable>(from url: URL, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void)
}

public class NetworkManager: NetworkManaging {

    init() {
        
    }

    func data<T: Decodable>(from url: URL, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.error(error!)))
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.noData))
                    return
                }
                completion(.success(data as! T))
            }
        }
        task.resume()
    }
}
