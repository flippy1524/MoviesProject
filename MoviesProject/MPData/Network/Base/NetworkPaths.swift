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
        
        enum Search {
            static var movie =      "3/search/movie"
            static var tv =         "3/search/tv"
        }
        
        enum Genres {
            static var movie =       "3/genre/movie/list"
            static var tv =          "3/genre/tv/list"
        }
        
        enum Details {
            static func movie(id: Int) -> String {
                return "3/movie/\(id)"
            }
            
            static func tv(id: Int) -> String {
                return "3/tv/\(id)"
            }
        }
    }
}
