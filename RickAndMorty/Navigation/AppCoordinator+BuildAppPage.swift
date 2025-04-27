import SwiftUI

extension AppCoordinator {
    @ViewBuilder
    func buildAppPage(_ appPage: AppPage) -> some View {
        switch appPage {
        case .characterDetail(let character):
            CharacterDetailView(character: character)
        case .episodeDetail(let episode):
            EpisodeDetailView(episode: episode)
        case .episodeList:
            EpisodeListView()
        }
    }
}
