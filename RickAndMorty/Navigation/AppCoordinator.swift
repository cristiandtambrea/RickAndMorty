import SwiftUI

@Observable
final class AppCoordinator: Coordinator {

    var path: NavigationPath {
        get { _path }
        set { _path = newValue }
    }

    private var _path = NavigationPath()

    func push(page: AppPage) {
        _path.append(page)
    }

    func pop() {
        _path.removeLast()
    }

    func popToRoot() {
        _path.removeLast(_path.count)
    }
}
