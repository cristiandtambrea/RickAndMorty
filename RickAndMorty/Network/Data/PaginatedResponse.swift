import Foundation

struct PaginatedResponse<T: Decodable>: Decodable {

    /// Metadata about the current page.
    let info: Info

    /// An array of results of a specific type (Character, Episode, or Location).
    let results: [T]
}
