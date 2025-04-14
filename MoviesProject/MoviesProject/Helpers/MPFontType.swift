//
//  FontType.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

/*
 This can be extended to work
 */
import SwiftUI


public extension Font {
    static func font(with type: MPFontType) -> Font {
        type.font
    }
}

public extension UIFont {
    static func uiFont(with type: MPFontType) -> UIFont {
        type.uiFont
    }
}

public enum MPFontType {
    case titleLarge
    case title1
    case title2
    case title3
    case headline
    case body
    case body2
    case subhead
    case footnote
    case caption1
    case caption2
    case tabBarText
    
    var size: CGFloat {
        switch self {
        case .titleLarge: return 34
        case .title1: return 28
        case .title2: return 22
        case .title3: return 20
        case .headline: return 16
        case .body: return 16
        case .body2: return 14
        case .subhead: return 14
        case .footnote: return 12
        case .caption1: return 12
        case .caption2: return 10
        case .tabBarText: return 10
        }
    }
    
    var weight: Font.Weight {
        switch self {
        case .titleLarge: return .bold
        case .title1: return .medium
        case .title2: return .medium
        case .title3: return .medium
        case .headline: return .semibold
        case .body: return .regular
        case .body2: return .regular
        case .subhead: return .semibold
        case .footnote: return .regular
        case .caption1: return .medium
        case .caption2: return .regular
        case .tabBarText: return .bold
        }
    }
    
    var uiWeight: UIFont.Weight {
        switch self {
        case .titleLarge: return .bold
        case .title1: return .medium
        case .title2: return .medium
        case .title3: return .medium
        case .headline: return .semibold
        case .body: return .regular
        case .body2: return .regular
        case .subhead: return .semibold
        case .footnote: return .regular
        case .caption1: return .medium
        case .caption2: return .regular
        case .tabBarText: return .bold
        }
    }
    
    var defaultColor: Color {
        switch self {
        case .titleLarge:
            return Color(.onSurface)
        case .title1:
            return Color(.onSurface)
        case .title2:
            return Color(.onSurface)
        case .title3:
            return Color(.onSurface)
        case .headline:
            return Color(.onSurface)
        case .body:
            return Color(.onSurface)
        case .body2:
            return Color(.onSurfaceVariant)
        case .subhead:
            return Color(.onSurface)
        case .footnote:
            return Color(.onSurfaceVariant)
        case .caption1:
            return Color(.onSurface)
        case .caption2:
            return Color(.onSurface)
        case .tabBarText:
            return .black
        }
    }
    
    var font: Font {
        return Font.system(size: size, weight: weight)
    }

    var uiFont: UIFont {
        return UIFont.systemFont(ofSize: size, weight: uiWeight)
    }
}
