import Foundation

@Observable
final class EpisodeListViewModel {
    var episodes = [Episode]()
    var hasMoreEpisodes: Bool { nextEpisodeEndpoint != nil }
    private var isFetching = false
    private var nextEpisodeEndpoint: String?

    func fetchEpisodes() async {
        guard !isFetching else { return }
        isFetching = true
        defer { isFetching = false }
        switch await EpisodeService.shared.fetchEpisodes(endpoint: nextEpisodeEndpoint) {
        case .success(let data):
            episodes += data.results
            nextEpisodeEndpoint = data.info.next
        case .failure(let error):
            print("#TODO Handle error: \(String(describing: error.localizedDescription))")
        }
    }
}
