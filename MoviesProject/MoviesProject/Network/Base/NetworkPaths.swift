//
//  NetworkPaths.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import Foundation

public struct NetworkPaths {
    enum V3 {
        enum Movie {
            static var nowPlaying = "3/movie/now_playing"
            static var popular =    "3/movie/popular"
            static var topRated =   "3/movie/top_rated"
            static var upcoming =   "3/movie/upcoming"
        }
    }
}
