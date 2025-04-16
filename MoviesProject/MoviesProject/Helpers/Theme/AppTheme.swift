//
//  AppTheme.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//


import UIKit
import SwiftUI

public struct AppTheme {
    
    let palette: ThemePalette
    
    @AppStorage(Constants.AppStorage.appearance) var appearance: AppAppearance = .system

    public init(palette: ThemePalette) {
        self.palette = palette
    }
    
    func colorForAppearance(color: UIColor, dark: UIColor? = nil) -> UIColor {
        let darkColor = dark ?? color
        let lightColor = color
        switch appearance {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        case .system:
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                switch traitCollection.userInterfaceStyle {
                case .dark:
                    return darkColor
                default:
                    return lightColor
                }
            }
        }
    }
}

extension AppTheme: Theme {    
    //MARK: - Container: Primary
    public var primary: UIColor {
        return colorForAppearance(color: palette.tokens.Primary40, dark: palette.tokens.Primary80)
    }
    
    public var onPrimary: UIColor {
       return colorForAppearance(color: palette.tokens.Primary100, dark: palette.tokens.Primary20)
    }
    
    public var primaryContainer: UIColor {
        return colorForAppearance(color: palette.tokens.Primary90, dark: palette.tokens.Primary30)
    }
    
    public var onPrimaryContainer: UIColor {
        return colorForAppearance(color: palette.tokens.Primary10, dark: palette.tokens.Primary90)
    }
    
    public var primaryFixed: UIColor {
        return colorForAppearance(color: palette.tokens.Primary40)
    }
    
    public var onPrimaryFixed: UIColor {
        return colorForAppearance(color: palette.tokens.Primary100)
    }
    
    public var primaryFocus: UIColor {
        return primary.withAlphaComponent(0.12)
    }
    
    //MARK: - Container: Secondary
    
    public var secondary: UIColor {
        return colorForAppearance(color: palette.tokens.Secondary40, dark: palette.tokens.Secondary80)
    }
    
    public var onSecondary: UIColor {
        return colorForAppearance(color: palette.tokens.Secondary100, dark: palette.tokens.Secondary20)
    }
    
    public var secondaryContainer: UIColor {
        return colorForAppearance(color: palette.tokens.Secondary90, dark: palette.tokens.Secondary30)
    }
    
    public var onSecondaryContainer: UIColor {
        return colorForAppearance(color: palette.tokens.Secondary10, dark: palette.tokens.Secondary90)
    }
    
    //MARK: - Container: Error
    public var error: UIColor {
        return colorForAppearance(color: palette.tokens.Error40, dark: palette.tokens.Error90)
    }
    
    public var onError: UIColor {
        return colorForAppearance(color: palette.tokens.Error100, dark: palette.tokens.Error20)
    }
    
    
    public var errorContainer: UIColor {
        return colorForAppearance(color: palette.tokens.Error90, dark: palette.tokens.Error30)
    }
    
    
    public var onErrorContainer: UIColor {
        return colorForAppearance(color: palette.tokens.Error10, dark: palette.tokens.Error90)
    }
    
    //MARK: - Container: Surface
    
    public var surface: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral99, dark: palette.tokens.Neutral20)
    }
    
    public var onSurface: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral10, dark: palette.tokens.Neutral90)
    }
    
    public var onSurfaceVariant: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral30, dark: palette.tokens.Neutral80)
    }
    
    public var surfaceVariant: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral90, dark: palette.tokens.Neutral30)
    }
    
    
    public var surfaceContainerLowest: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral100, dark: palette.tokens.Neutral0)
    }
    
    public var surfaceContainerHigh: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral90, dark: palette.tokens.Neutral30)
    }
    
    public var surfaceContainer: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral95, dark: palette.tokens.Neutral20)
    }
    
    public var onSurfaceHover: UIColor {
        return onSurface.withAlphaComponent(0.08)
    }
    
    public var onSurfaceFocus: UIColor {
        return onSurface.withAlphaComponent(0.12)
    }
    
    public var onSurfaceDim: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral60)
    }
    
    //MARK: - Container: Background
    
    public var background: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral95, dark: palette.tokens.Neutral10)
    }
    

    public var onBackground: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral10, dark: palette.tokens.Neutral90)
    }
    
    public var grayBackground: UIColor {
        return .gray.withAlphaComponent(0.7)
    }
    
    //MARK: - Outline
    
    public var outlineVariant: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral80, dark: palette.tokens.Neutral30)
    }
    
    public var outline: UIColor {
        return colorForAppearance(color: palette.tokens.Neutral50, dark: palette.tokens.Neutral60)
    }
}
