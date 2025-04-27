import Foundation

struct Episode: Decodable, Hashable, Identifiable {

    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }

    /// The id of the episode.
    let id: Int

    /// The name of the episode.
    let name: String

    /// The air date of the episode.
    let airDate: Date

    /// The code of the episode.
    let episode: String

    /// List of characters (urls) who have been seen in the episode.
    let characters: [String]

    /// Link (url) to the episode's own endpoint.
    let url: String

    /// Time at which the episode was created in the database.
    let created: Date
}
