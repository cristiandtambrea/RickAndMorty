import Foundation

private let baseEndpoint = "https://rickandmortyapi.com/api"

enum Endpoint: String {
    case character, episode, location

    func url(withQueryItems queryItems: [URLQueryItem]? = nil) -> URL? {
        var urlComponents = URLComponents(string: "\(baseEndpoint)/\(rawValue)")
        urlComponents?.queryItems = queryItems
        return urlComponents?.url
    }
}
