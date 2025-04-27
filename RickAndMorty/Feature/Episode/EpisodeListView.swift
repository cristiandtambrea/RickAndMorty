import SwiftUI

struct EpisodeListView: View {
    @AppStorage(AppStorageKey.lastRefreshDate.rawValue) private var lastRefreshDate: Date?
    @Environment(\.modelContext) private var modelContext
    @State private var viewModel = EpisodeListViewModel()

    var body: some View {
        List {
            if let lastRefreshDate {
                Text("Last refresh: \(lastRefreshDate.formatted(date: .numeric, time: .standard))")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.secondary)
                    .padding(.horizontal)
                    .clearListRowStyle()
            }
            ForEach(viewModel.episodes) { episode in
                EpisodeRowView(episode: episode)
                    .clearListRowStyle()
            }
            loadMoreView
                .clearListRowStyle()
        }
        .listStyle(.plain)
        .navigationTitle("Episodes")
        .refreshable { try? await PersistenceViewModel.shared.updateEpisodes(context: modelContext) }
        .task { await viewModel.fetchEpisodes() }
    }

    @ViewBuilder
    private var loadMoreView: some View {
        if viewModel.hasMoreEpisodes {
            DotPulseLoadingView()
                .frame(maxWidth: .infinity)
                .task { await viewModel.fetchEpisodes() }
        } else {
            Text("All episodes loaded!")
                .font(.body)
                .frame(maxWidth: .infinity)
                .padding()
        }
    }
}
