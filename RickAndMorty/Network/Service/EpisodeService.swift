import Foundation

final class EpisodeService {

    static let shared = EpisodeService()

    private let decoder: JSONDecoder

    private init() {
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom { decoder in
            let container = try decoder.singleValueContainer()
            let dateString = try container.decode(String.self)
            let customDateFormatter = DateFormatter()
            customDateFormatter.dateFormat = "MMMM d, yyyy"
            customDateFormatter.locale = Locale(identifier: "en_US_POSIX")
            if let date = customDateFormatter.date(from: dateString) {
                return date
            }
            let isoFormatter = ISO8601DateFormatter()
            isoFormatter.formatOptions = .withFractionalSeconds
            if let date = isoFormatter.date(from: dateString) {
                return date
            }
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string: \(dateString)")
        }
    }

    func fetchEpisodes(endpoint: String? = nil) async -> Result<PaginatedResponse<Episode>, APIError> {
        let url = if let endpoint { URL(string: endpoint) } else { Endpoint.episode.url() }
        guard let url else {
            return .failure(.system(URLError(.badURL)))
        }
        return await NetworkManager.fetch(from: url, decoder: decoder)
    }
}
