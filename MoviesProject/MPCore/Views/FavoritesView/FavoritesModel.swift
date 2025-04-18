//
//  FavoritesModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import Foundation
import MPData

enum FavoritesModel {
    enum Action {
        case fetchFavorites
        case showDetails(content: MPContent, type: ContentType)
    }
}

protocol FavoritesViewModelProtocol: ObservableObject {
    var movieList: [MPContent] { get set }
    var tvList: [MPContent] { get set }
    var selectedContent: ContentDetailsData? { get set }

    var hasContent: Bool { get }
    var hasMovieContent: Bool { get }
    var hasTvContent: Bool { get }

    func handle(_ action: FavoritesModel.Action)
}
