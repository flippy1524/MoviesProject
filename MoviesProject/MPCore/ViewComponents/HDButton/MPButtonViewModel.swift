//
//  MPButtonViewModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import SwiftUI
import Combine

public class MPButtonViewModel: ObservableObject {
    @Published var isEnabled: Bool = true
    @State var title: String
    var image: Image?
    var chevronImage: Image?
    
    @Published var style: MPButton.ButtonStyle

    init(isEnabled: Bool, title: String, image: Image?, chevronImage: Image?, style: MPButton.ButtonStyle) {
        self.isEnabled = isEnabled
        self.title = title
        self.image = image
        self.chevronImage = chevronImage
        self.style = style
    }
}
