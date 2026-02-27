import SwiftUI

struct ChecklistsView: View {
    @Environment(AppStore.self) private var store
    @State private var showCreate = false

    var body: some View {
        NavigationStack {
            AppShell {
                VStack(spacing: 0) {
                    titleBar

                    ScrollView {
                        LazyVStack(spacing: AppTheme.Spacing.listItemGap) {
                            ForEach(store.checklistTypes) { type in
                                NavigationLink(value: type.id) {
                                    ChecklistTypeCardView(type: type)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, AppTheme.Spacing.screenHorizontal)
                        .padding(.top, 16)
                        .padding(.bottom, AppTheme.Size.primaryButtonHeight + 40)
                    }

                    PrimaryButton(title: "+ Create Custom Type") {
                        showCreate = true
                    }
                    .padding(.horizontal, AppTheme.Spacing.screenHorizontal)
                    .padding(.bottom, 16)
                    .navigationDestination(isPresented: $showCreate) {
                        CreateChecklistTypeView()
                    }
                }
                .padding(.bottom, AppTheme.Size.tabBarHeight)
            }
            .navigationDestination(for: UUID.self) { typeId in
                ChecklistDetailView(typeId: typeId)
            }
            .navigationBarHidden(true)
        }
    }

    private var titleBar: some View {
        HStack {
            Text("Checklists")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(AppTheme.Colors.textPrimary)
            Spacer()
        }
        .padding(.horizontal, AppTheme.Spacing.screenHorizontal)
        .frame(height: AppTheme.Size.topBarHeight)
    }
}
