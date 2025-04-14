//
//  ContentEnums.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import SwiftData

enum MovieCategory: CaseIterable, RelationshipCollection {
    typealias PersistentElement = HomeContent

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
            "Now Playing"
        case .popular:
            "Popular"
        case .topRated:
            "Top Rated"
        case .upcoming:
            "Upcoming"
        }
    }
}

enum ContentType {
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
}
