//
//  ThemeProtocol.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import UIKit

public enum ThemeColor {
    // Primary Container Colors
    case primary
    case onPrimary
    case primaryContainer
    case onPrimaryContainer
    case primaryFixed
    case onPrimaryFixed
    case primaryFocus
    
    // Secondary Container Colors
    case secondary
    case onSecondary
    case secondaryContainer
    case onSecondaryContainer
    
    // Error Container Colors
    case error
    case onError
    case errorContainer
    case onErrorContainer
    
    // Surface Container Colors
    case surface
    case onSurface
    case onSurfaceVariant
    case surfaceContainerLowest
    case surfaceContainerHigh
    case surfaceContainer
    case onSurfaceHover
    case onSurfaceFocus
    case surfaceVariant
    case onSurfaceDim
    
    // Background Colors
    case background
    case onBackground
    case grayBackground
    
    // Outline Colors
    case outline
    case outlineVariant    
}

public protocol Theme {
    //MARK: - Container: Primary
    var primary: UIColor { get }
    var onPrimary: UIColor { get }
    var primaryContainer: UIColor { get }
    var onPrimaryContainer: UIColor { get }
    var primaryFixed: UIColor { get }
    var onPrimaryFixed: UIColor { get }
    var primaryFocus: UIColor { get }

    //MARK: - Container: Secondary
    var secondary: UIColor { get }
    var onSecondary: UIColor { get }
    var secondaryContainer: UIColor { get }
    var onSecondaryContainer: UIColor { get }
    
    //MARK: - Container: Error
    var error: UIColor { get }
    var onError: UIColor { get }
    var errorContainer: UIColor { get }
    var onErrorContainer: UIColor { get }
    
    //MARK: - Container: Surface
    var surface: UIColor { get }
    var onSurface: UIColor { get }
    var onSurfaceVariant: UIColor { get }
    var surfaceContainerLowest: UIColor { get }
    var surfaceContainerHigh: UIColor { get }
    var surfaceContainer: UIColor { get }
    var onSurfaceHover: UIColor { get }
    var onSurfaceFocus: UIColor { get }
    var surfaceVariant: UIColor { get }
    var onSurfaceDim: UIColor { get }

    //MARK: - Container: Background
    var background: UIColor { get }
    var onBackground: UIColor { get }
    var grayBackground: UIColor { get }

    //MARK: - Outline
    var outline: UIColor { get }
    var outlineVariant: UIColor { get }
}
