//
//  MPCornerRadius.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//


import SwiftUI

public enum MPCornerRadius: CGFloat, RawRepresentable {
    case none = 0
    case extraSmall = 2
    case small = 4
    case medium = 8
    case large = 12
    case extraLarge = 16
    case extraExtraLarge = 20
}

extension View {
    func cornerRadius(_ radius: MPCornerRadius, corners: UIRectCorner = .allCorners) -> some View {
        clipShape( RoundedCorner(radius: radius.rawValue, corners: corners) )
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
