import Foundation

final class CharacterService {

    static let shared = CharacterService()

    private let decoder: JSONDecoder

    private init() {
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
    }

    func fetchCharacter(endpoint: String) async -> Result<Character, APIError> {
        if let url = URL(string: endpoint) {
            await NetworkManager.fetch(from: url, decoder: decoder)
        } else {
            .failure(.system(URLError(.badURL)))
        }
    }

    func fetchCharacterImage(endpoint: String) async -> Result<Data, APIError> {
        if let url = URL(string: endpoint) {
            await NetworkManager.fetchData(from: url)
        } else {
            .failure(.system(URLError(.badURL)))
        }
    }
}
