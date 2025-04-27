import CoreTransferable
import Foundation

struct Character: Codable, Identifiable, Hashable {

    /// The id of the character.
    let id: Int

    /// The name of the character.
    let name: String

    /// The status of the character ('Alive', 'Dead' or 'unknown').
    let status: String

    /// The species of the character.
    let species: String

    /// The type or subspecies of the character.
    let type: String

    /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
    let gender: String

    /// Name and link (url) to the character's origin location.
    let origin: CharacterLocation

    /// Name and link to the character's last known location endpoint.
    let location: CharacterLocation

    /// Link (url) to the character's image.
    /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
    let image: String

    /// List of episodes (urls) in which this character appeared.
    let episode: [String]

    /// Link (url) to the character's own URL endpoint.
    let url: String

    /// Time at which the character was created in the database.
    let created: String
}

extension Character: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .json)
            .suggestedFileName { $0.name }
    }
}
