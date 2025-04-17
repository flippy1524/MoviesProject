//
//  FontType.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

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

public struct FontAttributes {
    let size: CGFloat
    let weight: Font.Weight
    let uiWeight: UIFont.Weight
    let defaultColor: Color
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
    
    var attributes: FontAttributes {
        switch self {
        case .titleLarge:
            return FontAttributes(
                size: 34,
                weight: .bold,
                uiWeight: .bold,
                defaultColor: Color(.onSurface)
            )
            
        case .title1:
            return FontAttributes(
                size: 28,
                weight: .medium,
                uiWeight: .medium,
                defaultColor: Color(.onSurface)
            )
            
        case .title2:
            return FontAttributes(
                size: 22,
                weight: .medium,
                uiWeight: .medium,
                defaultColor: Color(.onSurface)
            )
            
        case .title3:
            return FontAttributes(
                size: 20,
                weight: .medium,
                uiWeight: .medium,
                defaultColor: Color(.onSurface)
            )
            
        case .headline:
            return FontAttributes(
                size: 16,
                weight: .semibold,
                uiWeight: .semibold,
                defaultColor: Color(.onSurface)
            )
            
        case .body:
            return FontAttributes(
                size: 16,
                weight: .regular,
                uiWeight: .regular,
                defaultColor: Color(.onSurface)
            )
            
        case .body2:
            return FontAttributes(
                size: 14,
                weight: .regular,
                uiWeight: .regular,
                defaultColor: Color(.onSurfaceVariant)
            )
            
        case .subhead:
            return FontAttributes(
                size: 14,
                weight: .semibold,
                uiWeight: .semibold,
                defaultColor: Color(.onSurface)
            )
            
        case .footnote:
            return FontAttributes(
                size: 12,
                weight: .regular,
                uiWeight: .regular,
                defaultColor: Color(.onSurfaceVariant)
            )
            
        case .caption1:
            return FontAttributes(
                size: 12,
                weight: .medium,
                uiWeight: .medium,
                defaultColor: Color(.onSurface)
            )
            
        case .caption2:
            return FontAttributes(
                size: 10,
                weight: .regular,
                uiWeight: .regular,
                defaultColor: Color(.onSurface)
            )
            
        case .tabBarText:
            return FontAttributes(
                size: 10,
                weight: .bold,
                uiWeight: .bold,
                defaultColor: .black
            )
        }
    }

    var font: Font {
        return Font.system(size: attributes.size, weight: attributes.weight)
    }

    var uiFont: UIFont {
        return UIFont.systemFont(ofSize: attributes.size, weight: attributes.uiWeight)
    }
}
