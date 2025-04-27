import SwiftUI

protocol Coordinator {
    var path: NavigationPath { get set }
    func push(page: AppPage)
    func pop()
    func popToRoot()
}
