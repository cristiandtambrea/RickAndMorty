import SwiftUI

struct ClearListRowStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Color.clear)
            .listRowInsets(EdgeInsets(.zero))
            .listRowSeparator(.hidden)
    }
}

extension View {
    func clearListRowStyle() -> some View {
        self.modifier(ClearListRowStyle())
    }
}
