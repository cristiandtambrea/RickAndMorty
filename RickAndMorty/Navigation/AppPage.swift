import Foundation

enum AppPage: Hashable {
    case characterDetail(Character)
    case episodeDetail(Episode)
    case episodeList
}
