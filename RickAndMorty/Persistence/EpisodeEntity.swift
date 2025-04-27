import Foundation
import SwiftData

@Model
final class EpisodeEntity: Identifiable {
    @Attribute(.unique) var id: Int
    var name: String
    var airDate: Date
    var code: String
    var characterURLs: [String]
    var urlString: String
    var createdAt: Date

    init(
        id: Int,
        name: String,
        airDate: Date,
        code: String,
        characterURLs: [String],
        urlString: String,
        createdAt: Date
    ) {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.code = code
        self.characterURLs = characterURLs
        self.urlString = urlString
        self.createdAt = createdAt
    }
}

extension EpisodeEntity {
    convenience init(from episode: Episode) {
        self.init(
            id: episode.id,
            name: episode.name,
            airDate: episode.airDate,
            code: episode.episode,
            characterURLs: episode.characters,
            urlString: episode.url,
            createdAt: episode.created
        )
    }
}
