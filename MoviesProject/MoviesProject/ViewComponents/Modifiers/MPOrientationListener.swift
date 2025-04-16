//
//  MPOrientationListener.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 15.4.25.
//

import SwiftUI


struct MPDeviceRotationViewModifier: ViewModifier {
    let action: FunctionClosure
    let includeOnAppear: Bool
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    func body(content: Content) -> some View {
        content
            .onAppear(perform: {
                if includeOnAppear {
                    action()
                }
            })
            .onChange(of: horizontalSizeClass) {
                action()
            }
            .onChange(of: verticalSizeClass) {
                action()
            }
    }
}

extension View {
    func onRotate(includeOnAppear: Bool = true, action: @escaping FunctionClosure) -> some View {
        self.modifier(MPDeviceRotationViewModifier(action: action, includeOnAppear: includeOnAppear))
    }
}
