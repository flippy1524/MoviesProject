//
//  AppAppearance.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import MPUtils

public enum AppAppearance: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case system = "System"
    
    var localized: String {
        switch self {
        case .light:
            Localized.Settings.appearanceLight
        case .dark:
            Localized.Settings.appearanceDark
        case .system:
            Localized.Settings.appearanceSystem
        }
    }
}
