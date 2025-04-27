import Foundation

struct Location: Decodable {

    /// The id of the location.
    let id: Int

    /// The name of the location.
    let name: String

    /// The type of the location.
    let type: String

    /// The dimension in which the location is located.
    let dimension: String

    /// List of character (urls) who have been last seen in the location.
    let residents: [String]

    /// Link (url) to the location's own endpoint.
    let url: String

    /// Time at which the location was created in the database.
    let created: String
}
