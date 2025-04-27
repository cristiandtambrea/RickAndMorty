import SwiftUI

struct EpisodeDetailView: View {
    let episode: Episode
    private let gridColumns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(episode.name)
                    .font(.headline)
                    .lineLimit(nil)
                Text(episode.airDate.ddMMyyyy)
                    .font(.subheadline)
                Divider()
                Text("\(episode.characters.count) Characters")
                    .font(.headline)
            }
            .padding(.horizontal)
            LazyVGrid(columns: gridColumns) {
                ForEach(episode.characters, id: \.self) { endpoint in
                    CharacterRowView(endpoint: endpoint)
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(episode.episode)
    }
}
