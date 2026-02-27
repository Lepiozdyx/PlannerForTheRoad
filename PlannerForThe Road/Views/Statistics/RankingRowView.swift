import SwiftUI

struct RankingRowView: View {
    let rank: Int
    let title: String
    let distanceKm: Int

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(badgeColor)
                    .frame(width: AppTheme.Size.rankBadgeSize,
                           height: AppTheme.Size.rankBadgeSize)
                Text("\(rank)")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundStyle(.white)
            }

            Text(title)
                .font(.system(size: 15, weight: .medium))
                .foregroundStyle(AppTheme.Colors.textPrimary)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("\(distanceKm) km")
                .font(.system(size: 15, weight: .semibold))
                .foregroundStyle(AppTheme.Colors.accentSecondary)
        }
        .padding(14)
        .background(AppTheme.Colors.surfaceElevated)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    private var badgeColor: Color {
        switch rank {
        case 1: return Color(hex: "F4C542")
        case 2: return Color(hex: "A0A8B8")
        case 3: return Color(hex: "B87333")
        default: return AppTheme.Colors.progressTrack
        }
    }
}
