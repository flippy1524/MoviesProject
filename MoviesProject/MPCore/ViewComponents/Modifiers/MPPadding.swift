//
//  MPPadding.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//


import Foundation
import SwiftUI

public enum MPPadding: CGFloat, RawRepresentable {
    case zero = 0
    case extraExtraExtraSmall = 2
    case extraExtraSmall = 4
    case extraSmall = 8
    case small = 12
    case medium = 16
    case large = 24
    case extraLarge = 32
    case extraExtraLarge = 48
    case extraExtraExtraLarge = 64

}

extension View {
    public func padding(_ edges: Edge.Set, _ lenght: MPPadding = .medium) -> some View {
        self.padding(edges, lenght.rawValue)
    }
}
