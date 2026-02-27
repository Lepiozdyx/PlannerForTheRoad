import SwiftUI

@main
struct PlannerForThe_RoadApp: App {
    @State private var store = AppStore()

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environment(store)
                .preferredColorScheme(.dark)
        }
    }
}
