import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    @Environment(AppCoordinator.self) private var coordinator
    @State private var exportedFileURL: URL?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: character.image)) { phase in
                    switch phase {
                    case .empty:
                        DotPulseLoadingView()
                            .frame(maxWidth: .infinity)
                    case .success(let image):
                        characterImage(image)
                            .clipShape(Capsule())
                    case .failure:
                        characterImage(Image(systemName: "person.crop.square"))
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
                Text(character.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                VStack(spacing: 10) {
                    detailRow(title: "Status", value: character.status)
                    detailRow(title: "Species", value: character.species)
                    if !character.type.isEmpty {
                        detailRow(title: "Type", value: character.type)
                    }
                    detailRow(title: "Gender", value: character.gender)
                    detailRow(title: "Origin", value: character.origin.name)
                    detailRow(title: "Location", value: character.location.name)
                    detailRow(title: "Appearances", value: "\(character.episode.count) episode(s)")
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(character.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                ShareLink(item: character, preview: SharePreview(character.name))
            }
        }
    }

    @ViewBuilder
    private func characterImage(_ image: Image) -> some View {
        image
            .resizable()
            .scaledToFit()
            .frame(height: 300)
    }

    @ViewBuilder
    private func detailRow(title: String, value: String) -> some View {
        HStack {
            Text("\(title):")
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .foregroundColor(.secondary)
        }
    }
}
