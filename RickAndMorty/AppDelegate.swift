import BackgroundTasks
import Foundation
import SwiftData
import UIKit

@MainActor
final class AppDelegate: NSObject, UIApplicationDelegate {

    var modelContainer: ModelContainer = {
        let schema = Schema([EpisodeEntity.self])
        let modelConfiguration = ModelConfiguration(schema: schema)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.example.RickAndMorty.refresh", using: nil) { [weak self] task in
            guard let self, let task = task as? BGAppRefreshTask else { return }
            handleAppRefresh(task: task)
        }
        scheduleAppRefresh()
        return true
    }

    private func handleAppRefresh(task: BGAppRefreshTask) {
        scheduleAppRefresh()
        let refresh = Task(priority: .background) { [modelContainer] in
            defer { task.setTaskCompleted(success: !Task.isCancelled) }
            do {
                try await PersistenceViewModel.shared.updateEpisodes(context: ModelContext(modelContainer))
            } catch {
                task.setTaskCompleted(success: false)
            }
        }
        task.expirationHandler = {
            refresh.cancel()
        }
    }

    private func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.example.RickAndMorty.refresh")
        request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60)
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Could not schedule app refresh.", "#TODO Handle error: \(String(describing: error.localizedDescription))")
        }
    }
}
