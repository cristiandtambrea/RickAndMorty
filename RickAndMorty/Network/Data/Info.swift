import Foundation

struct Info: Decodable {

    /// The length of the response
    let count: Int

    /// The amount of pages
    let pages: Int

    /// Link (url) to the next page (if it exists)
    let next: String?

    /// Link (url) to the previous page (if it exists)
    let prev: String?
}
