//
//  View+Extensions.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import SwiftUI

extension View {
    public func hidden(if condition: Bool) -> some View {
        self.modifier(ConditionalHidden(isHidden: condition))
    }
    
    func frame(size: CGSize) -> some View {
        self.frame(width: size.width, height: size.height)
    }
    
    func frame(size: CGFloat) -> some View {
        self.frame(width: size, height: size)
    }
    
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
