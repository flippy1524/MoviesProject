//
//  MPNavigationStack.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import SwiftUI

struct MPNavigationStack<Content: View>: View {
    let content: () -> Content

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                content()
            }
        }
    }
}
