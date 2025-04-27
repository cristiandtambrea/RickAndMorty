import SwiftUI

struct CharacterRowView: View {
    let endpoint: String
    @Environment(AppCoordinator.self) private var coordinator
    @State private var viewModel = CharacterRowViewModel()

    var body: some View {
        VStack {
            if let character = viewModel.character {
                Button {
                    coordinator.push(page: .characterDetail(character))
                } label: {
                    VStack {
                        Text("(\(character.id))")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.secondary)
                        Text(character.name)
                            .font(.headline)
                            .lineLimit(nil)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color.primary)
                    }
                }
            } else {
                DotPulseLoadingView()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color(.systemBackground))
        )
        .shadow(color: .black.opacity(0.1), radius: 10, x: .zero, y: 1)
        .padding(.vertical, 5)
        .task { await viewModel.fetchCharacter(endpoint: endpoint) }
    }
}
