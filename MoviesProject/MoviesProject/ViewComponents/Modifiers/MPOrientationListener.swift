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

    func body(content: Content) -> some View {
        content
            .onAppear {
                if includeOnAppear {
                    action()
                }
                NotificationCenter.default.addObserver(
                    forName: UIDevice.orientationDidChangeNotification,
                    object: nil,
                    queue: .main
                ) { _ in
                    action()
                }
            }
            .onDisappear {
                NotificationCenter.default.removeObserver(
                    self,
                    name: UIDevice.orientationDidChangeNotification,
                    object: nil
                )
            }
    }
}

extension View {
    func onRotate(includeOnAppear: Bool = true, action: @escaping FunctionClosure) -> some View {
        self.modifier(MPDeviceRotationViewModifier(action: action, includeOnAppear: includeOnAppear))
    }
}
