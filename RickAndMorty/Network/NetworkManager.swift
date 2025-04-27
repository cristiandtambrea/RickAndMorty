import Foundation

enum NetworkManager {
    static func fetch<T: Decodable>(from url: URL, decoder: JSONDecoder = JSONDecoder()) async -> Result<T, APIError> {
        switch await fetchData(from: url) {
        case .success(let data):
            do {
                return .success(try decoder.decode(T.self, from: data))
            } catch {
                return .failure(.decoding(error.localizedDescription))
            }
        case .failure(let error):
            return .failure(error)
        }
    }

    static func fetchData(from url: URL) async -> Result<Data, APIError> {
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            return switch httpResponse.statusCode {
            case 200...299:
                .success(data)
            default:
                .failure(.invalidStatusCode(httpResponse.statusCode))
            }
        } catch {
            return switch (error as NSError).code {
            case NSURLErrorNotConnectedToInternet:
                .failure(.connectivity(error.localizedDescription))
            case NSURLErrorTimedOut:
                .failure(.timeout(error.localizedDescription))
            case NSURLErrorCancelled:
                .failure(.requestCancelled)
            default:
                .failure(.system(error))
            }
        }
    }
}
