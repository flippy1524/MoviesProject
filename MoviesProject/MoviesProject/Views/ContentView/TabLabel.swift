//
//  TabLabel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import SwiftUI

struct TabLabel: View {
    let systemImage: String
    let text: String

    var body: some View {
        VStack {
            Image(systemName: systemImage)
            Text(text)
                .textStyle(type: .tabBarText)
        }
    }
}
