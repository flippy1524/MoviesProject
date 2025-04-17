//
//  SplashView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import SwiftUI

public struct SplashView: View {
    public init() {}
    
    public var body: some View {
        ZStack {
            Rectangle().fill(Color(.background))
                .ignoresSafeArea()
         Text("MoviesProject")
                .textStyle(type: .titleLarge)
        }
    }
}

#Preview {
    SplashView()
}
