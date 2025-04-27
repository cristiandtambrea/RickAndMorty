import SwiftUI

struct EpisodeRowView: View {
    let episode: Episode
    @Environment(AppCoordinator.self) private var coordinator

    var body: some View {
        Button {
            coordinator.push(page: .episodeDetail(episode))
        } label: {
            VStack(alignment: .leading) {
                Text(episode.name)
                    .font(.headline)
                    .lineLimit(nil)
                Text("\(episode.episode) - \(episode.airDate.ddMMyyyy)")
                    .font(.subheadline)
                    .lineLimit(nil)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color(.systemBackground))
            )
            .shadow(color: .black.opacity(0.1), radius: 10, x: .zero, y: 1)
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
    }
}
