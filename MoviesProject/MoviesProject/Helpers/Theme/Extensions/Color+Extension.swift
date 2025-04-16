//
//  Color+Extension.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import SwiftUI

public extension Color {
    
    init(_ themeColor: ThemeColor, _ theme: Theme? = nil) {
        self = themeColor.resolve(in: theme ?? ThemeManager.shared.current)
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension ThemeColor {
    func resolve(in theme: Theme) -> Color {
        switch self {
        case .primary: return Color(theme.primary)
        case .onPrimary: return Color(theme.onPrimary)
        case .primaryContainer: return Color(theme.primaryContainer)
        case .onPrimaryContainer: return Color(theme.onPrimaryContainer)
        case .primaryFixed: return Color(theme.primaryFixed)
        case .onPrimaryFixed: return Color(theme.onPrimaryFixed)
        case .primaryFocus: return Color(theme.primaryFocus)

        case .secondary: return Color(theme.secondary)
        case .onSecondary: return Color(theme.onSecondary)
        case .secondaryContainer: return Color(theme.secondaryContainer)
        case .onSecondaryContainer: return Color(theme.onSecondaryContainer)

        case .error: return Color(theme.error)
        case .onError: return Color(theme.onError)
        case .errorContainer: return Color(theme.errorContainer)
        case .onErrorContainer: return Color(theme.onErrorContainer)

        case .surface: return Color(theme.surface)
        case .onSurface: return Color(theme.onSurface)
        case .onSurfaceVariant: return Color(theme.onSurfaceVariant)
        case .surfaceContainerLowest: return Color(theme.surfaceContainerLowest)
        case .surfaceContainerHigh: return Color(theme.surfaceContainerHigh)
        case .surfaceContainer: return Color(theme.surfaceContainer)
        case .onSurfaceHover: return Color(theme.onSurfaceHover)
        case .onSurfaceFocus: return Color(theme.onSurfaceFocus)
        case .surfaceVariant: return Color(theme.surfaceVariant)
        case .onSurfaceDim: return Color(theme.onSurfaceDim)

        case .background: return Color(theme.background)
        case .onBackground: return Color(theme.onBackground)
        case .grayBackground: return Color(theme.grayBackground)

        case .outline: return Color(theme.outline)
        case .outlineVariant: return Color(theme.outlineVariant)
        }
    }
}
