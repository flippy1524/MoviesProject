//
//  ContentEnums.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import SwiftData

enum MovieCategory: CaseIterable {
    case nowPlaying
    case popular
    case topRated
    case upcoming
    
    var path: String {
        switch self {
        case .nowPlaying:
            NetworkPaths.V3.Movie.nowPlaying
        case .popular:
            NetworkPaths.V3.Movie.popular
        case .topRated:
            NetworkPaths.V3.Movie.topRated
        case .upcoming:
            NetworkPaths.V3.Movie.upcoming
        }
    }
    
    var title: String {
        switch self {
        case .nowPlaying:
            Localized.Category.nowPlaying
        case .popular:
            Localized.Category.popular
        case .topRated:
            Localized.Category.topRated
        case .upcoming:
            Localized.Category.upcoming
        }
    }
}

enum ContentType: CaseIterable, Codable {
    case movie
    case tv
    
    var searchPath: String {
        switch self {
        case .movie:
            NetworkPaths.V3.Search.movie
        case .tv:
            NetworkPaths.V3.Search.tv
        }
    }
    
    var genrePath: String {
        switch self {
        case .movie:
            NetworkPaths.V3.Genres.movie
        case .tv:
            NetworkPaths.V3.Genres.tv
        }
    }
    
    var title: String {
        switch self {
        case .movie:
            Localized.Content.movies
        case .tv:
            Localized.Content.tv
        }
    }
}
