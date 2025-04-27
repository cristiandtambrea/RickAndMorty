import Foundation

@Observable
final class CharacterRowViewModel {
    var character: Character?

    func fetchCharacter(endpoint: String) async {
        guard character == nil else { return }
        switch await CharacterService.shared.fetchCharacter(endpoint: endpoint) {
        case .success(let data):
            character = data
        case .failure(let error):
            print("#TODO Handle error: \(String(describing: error.localizedDescription))")
        }
    }
}
