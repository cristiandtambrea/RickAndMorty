import Foundation

extension APIError {
    var displayError: String? {
        switch self {
        case .requestCancelled:
            nil
        case .connectivity:
            "You're offline. Check your internet connection."
        case .timeout:
            "The request timed out. Please try again."
        case .invalidResponse, .invalidStatusCode:
            "Oops, something went wrong."
        case .decoding:
            "There was an error decoding the response."
        case .system(let error):
            error.localizedDescription
        }
    }
}
