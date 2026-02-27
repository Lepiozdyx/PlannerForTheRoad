import SwiftUI

struct AppShell<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            AppTheme.Colors.backgroundGradient
                .ignoresSafeArea()
            content
        }
        .tint(AppTheme.Colors.accentPrimary)
    }
}
