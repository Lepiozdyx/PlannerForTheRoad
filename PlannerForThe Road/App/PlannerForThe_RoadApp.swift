import SwiftUI

@main
struct PlannerForThe_RoadApp: App {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    @State private var store = AppStore()

    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                RootTabView()
                    .environment(store)
                    .preferredColorScheme(.dark)
            } else {
                OnboardingView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
