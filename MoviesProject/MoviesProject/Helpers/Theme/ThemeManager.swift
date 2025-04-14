//
//  ThemeManager.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//


public class ThemeManager {
    public static let shared = ThemeManager()
    private var appTarget: ThemeManagerAppTarget = .app1

    public func set(appTarget: ThemeManagerAppTarget) {
        self.appTarget = appTarget
    }
    
    public enum ThemeManagerAppTarget {
        case app1
        case app2
        case app3
        
        var themeForApp: AppTheme {
            switch self {
            case .app1:
                return AppTheme(palette: .app1)
            case .app2:
                return AppTheme(palette: .app2)
            case .app3:
                return AppTheme(palette: .app3)
            }
        }
    }

    public var current: Theme {
        return appTarget.themeForApp
    }
}
