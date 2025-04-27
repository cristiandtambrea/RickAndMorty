import Foundation

enum APIError: Error {
    case connectivity(String)
    case decoding(String)
    case invalidResponse
    case invalidStatusCode(Int)
    case requestCancelled
    case system(Error)
    case timeout(String)
}
