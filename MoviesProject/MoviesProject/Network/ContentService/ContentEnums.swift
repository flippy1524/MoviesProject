//
//  ContentEnums.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//


enum MovieCategory {
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
}
