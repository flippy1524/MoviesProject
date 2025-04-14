//
//  ConditionalHidden.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import Foundation
import SwiftUI


struct ConditionalHidden: ViewModifier {
    let isHidden: Bool

    func body(content: Content) -> some View {
        Group {
            if isHidden {
                content.hidden()
            } else {
                content
            }
        }
    }
}
