import SwiftData
import SwiftUI

@main
struct RickAndMortyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(delegate.modelContainer)
    }
}
