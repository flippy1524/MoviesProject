//
//  Color+Extension.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import SwiftUI

public extension Color {
    
    init(_ themeColor: ThemeColor, _ theme: Theme? = nil) {
        let theme = theme ?? ThemeManager.shared.current
        
        switch themeColor {
            // Primary Container Colors
        case .primary:
            self = Color(theme.primary)
        case .onPrimary:
            self = Color(theme.onPrimary)
        case .primaryContainer:
            self = Color(theme.primaryContainer)
        case .onPrimaryContainer:
            self = Color(theme.onPrimaryContainer)
        case .primaryFixed:
            self = Color(theme.primaryFixed)
        case .onPrimaryFixed:
            self = Color(theme.onPrimaryFixed)
        case .primaryFocus:
            self = Color(theme.primaryFocus)
            
            // Secondary Container Colors
        case .secondary:
            self = Color(theme.secondary)
        case .onSecondary:
            self = Color(theme.onSecondary)
        case .secondaryContainer:
            self = Color(theme.secondaryContainer)
        case .onSecondaryContainer:
            self = Color(theme.onSecondaryContainer)
            
            // Error Container Colors
        case .error:
            self = Color(theme.error)
        case .onError:
            self = Color(theme.onError)
        case .errorContainer:
            self = Color(theme.errorContainer)
        case .onErrorContainer:
            self = Color(theme.onErrorContainer)
            
            // Surface Container Colors
        case .surface:
            self = Color(theme.surface)
        case .onSurface:
            self = Color(theme.onSurface)
        case .onSurfaceVariant:
            self = Color(theme.onSurfaceVariant)
        case .surfaceContainerLowest:
            self = Color(theme.surfaceContainerLowest)
        case .surfaceContainerHigh:
            self = Color(theme.surfaceContainerHigh)
        case .surfaceContainer:
            self = Color(theme.surfaceContainer)
        case .onSurfaceHover:
            self = Color(theme.onSurfaceHover)
        case .onSurfaceFocus:
            self = Color(theme.onSurfaceFocus)
        case .surfaceVariant:
            self = Color(theme.surfaceVariant)
        case .onSurfaceDim:
            self = Color(theme.onSurfaceDim)

            // Background Colors
        case .background:
            self = Color(theme.background)
        case .onBackground:
            self = Color(theme.onBackground)
        case .grayBackground:
            self = Color(theme.grayBackground)
            
            // Outline Colors
        case .outline:
            self = Color(theme.outline)
        case .outlineVariant:
            self = Color(theme.outlineVariant)
   
        }
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
