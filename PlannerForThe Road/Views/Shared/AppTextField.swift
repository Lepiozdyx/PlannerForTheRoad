import SwiftUI

struct AppTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.labelToField) {
            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(AppTheme.Colors.textSecondary)

            TextField(placeholder, text: $text)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(AppTheme.Colors.textPrimary)
                .keyboardType(keyboardType)
                .tint(AppTheme.Colors.accentPrimary)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .frame(height: AppTheme.Size.inputHeight)
                .background(AppTheme.Colors.surfaceElevated)
                .clipShape(RoundedRectangle(cornerRadius: AppTheme.Radius.input))
        }
    }
}

struct AppTextArea: View {
    let label: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.labelToField) {
            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(AppTheme.Colors.textSecondary)

            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(.system(size: 16))
                        .foregroundStyle(AppTheme.Colors.textTertiary)
                        .padding(.horizontal, 12)
                        .padding(.top, 12)
                }
                TextEditor(text: $text)
                    .font(.system(size: 16))
                    .foregroundStyle(AppTheme.Colors.textPrimary)
                    .tint(AppTheme.Colors.accentPrimary)
                    .scrollContentBackground(.hidden)
                    .padding(8)
                    .frame(height: AppTheme.Size.textAreaHeight)
            }
            .background(AppTheme.Colors.surfaceElevated)
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.Radius.input))
        }
    }
}
