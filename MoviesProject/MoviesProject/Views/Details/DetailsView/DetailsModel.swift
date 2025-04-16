//
//  DetailsModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import Foundation

enum DetailsModel {
    enum Action {
        case fetchData
        case addToFavorites(Bool)
        case startWatching
    }
}

protocol DetailsViewModelProtocol: ObservableObject {
    var backdropPath: String? { get }
    var overview: String? { get }
    var favoriteTitle: String { get }
    
    func handle(_ action: DetailsModel.Action)
}
