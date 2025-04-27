import Foundation
import SwiftData

final class PersistenceViewModel {

    static let shared = PersistenceViewModel()

    private init() {
        // Singleton
    }

    func updateEpisodes(context: ModelContext) async throws {
        switch await EpisodeService.shared.fetchEpisodes() {
        case .success(let data):
            try context.transaction {
                data.results.forEach {
                    context.insert(EpisodeEntity(from: $0))
                }
            }
            UserDefaults.standard.set(Date.now, forKey: AppStorageKey.lastRefreshDate.rawValue)
        case .failure(let error):
            throw error
        }
    }
}
