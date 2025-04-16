//
//  PosterCardData.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

import Foundation


struct PosterCardData {
    let title: String?
    let posterPath: String?
    let overview: String?
    
    init(id: Int, title: String?, posterPath: String?, overview: String?) {
        self.title = title
        self.posterPath = posterPath
        self.overview = overview
    }
}
