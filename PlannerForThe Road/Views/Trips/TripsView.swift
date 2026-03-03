import SwiftUI

struct TripsView: View {
    @Environment(AppStore.self) private var store
    @State private var showCreate = false

    var body: some View {
        NavigationStack {
            AppShell {
                VStack(spacing: 0) {
                    titleBar

                    if store.trips.isEmpty {
                        emptyState
                    } else {
                        ScrollView {
                            LazyVStack(spacing: AppTheme.Spacing.cardGap) {
                                ForEach(store.trips) { trip in
                                    NavigationLink(value: trip) {
                                        TripCardView(trip: trip)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal, AppTheme.Spacing.screenHorizontal)
                            .padding(.top, 16)
                            .padding(.bottom, AppTheme.Size.primaryButtonHeight + 40)
                        }
                        .scrollIndicators(.hidden)
                        .contentMargins(.bottom, AppTheme.Size.tabBarHeight, for: .scrollContent)
                    }

                    newTripButton
                        .padding(.bottom, AppTheme.Size.tabBarHeight)
                }
            }
            .navigationDestination(for: Trip.self) { trip in
                TripDetailView(trip: trip)
            }
            .navigationBarHidden(true)
        }
    }

    private var titleBar: some View {
        HStack {
            Text("Trips")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(AppTheme.Colors.textPrimary)
            Spacer()
        }
        .padding(.horizontal, AppTheme.Spacing.screenHorizontal)
        .frame(height: AppTheme.Size.topBarHeight)
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Spacer()
            Image(systemName: "map")
                .font(.system(size: 48))
                .foregroundStyle(AppTheme.Colors.textTertiary)
            Text("No trips yet")
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(AppTheme.Colors.textPrimary)
            Text("Tap + New Trip to plan your first road trip")
                .font(.system(size: 15))
                .foregroundStyle(AppTheme.Colors.textTertiary)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(.horizontal, AppTheme.Spacing.screenHorizontal)
    }

    private var newTripButton: some View {
        PrimaryButton(title: "+ New Trip") {
            showCreate = true
        }
        .padding(.horizontal, AppTheme.Spacing.screenHorizontal)
        .padding(.bottom, 16)
        .navigationDestination(isPresented: $showCreate) {
            CreateTripView()
        }
    }
}

#Preview("With Trips") {
    TripsView()
        .environment(AppStore.preview)
}

#Preview("Empty State") {
    TripsView()
        .environment(AppStore())
}
