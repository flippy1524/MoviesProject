//
//  FavoritesViewModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import SwiftUI

class FavoritesViewModel: ObservableObject {
    @Service var manager: CacheManager?

    @Published var movieList: [MPContent] = []
    @Published var tvList: [MPContent] = []
    @Published var selectedContent: ContentDetailsData?
}

//MARK: Public methods

extension FavoritesViewModel: FavoritesViewModelProtocol {
    func handle(_ action: FavoritesModel.Action) {
        switch action {
        case .fetchFavorites:
            fetchData()
        case .showDetails(content: let content, type: let type):
            selectedContent = content.contentDetailsData(for: type)
        }
    }
    
    var hasContent: Bool {
        hasMovieContent || hasTvContent
    }
    
    var hasMovieContent: Bool {
        !movieList.isEmpty
    }
    
    var hasTvContent: Bool {
        !tvList.isEmpty
    }
}

//MARK: Private methods

private extension FavoritesViewModel {
    func fetchData() {
        if let dict = manager?.movieFavorites{
            let values = Array(dict.values)
            movieList = convertToContent(dataList: values)
        }
        if let dict = manager?.tvFavorites {
            let values = Array(dict.values)
            tvList = convertToContent(dataList: values)
        }
    }
    
    private func convertToContent(dataList: [ContentDetailsData]) -> [MPContent] {
        dataList.map({.init(id: $0.id, title: $0.title, name: nil, posterPath: $0.posterPath, backdropPath: $0.backdropPath, overview: $0.overview)})
    }
}
