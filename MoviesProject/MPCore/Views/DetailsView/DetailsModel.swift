//
//  DetailsModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import SwiftUI

enum DetailsModel {
    enum Action {
        case fetchData
        case toggleFavorite
        case startWatching
    }
}

protocol DetailsViewModelProtocol: ObservableObject {
    var backdropPath: String? { get }
    var overview: String? { get }
    var favoriteTitle: String { get }
    
    func handle(_ action: DetailsModel.Action)
}
