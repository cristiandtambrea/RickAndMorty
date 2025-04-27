import SwiftUI

struct ContentView: View {
    @State private var coordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.buildAppPage(.episodeList)
                .navigationDestination(for: AppPage.self) { page in
                    coordinator.buildAppPage(page)
                }
        }
        .environment(coordinator)
    }
}
