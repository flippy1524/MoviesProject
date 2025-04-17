//
//  PreviewData.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

import Foundation
import MPData

public struct PreviewData {
    enum Poster {
        public static var title = "Movie title long for two lines"
        public static var posterPath = "/k7eYdWvhYQyRQoU2TB2A2Xu2TfD.jpg"
        public static var backdropPath = "/uvitbjFU4JqvMwIkMWHp69bmUzG.jpg"
        public static var overview = "Description of a poster for a movie in one or multiple lines"
    }
    enum Content {
        public static var movieContent: MPContent {
            return .init(id: Int.random(in: 1..<10000), title: "Fight club \(Int.random(in: 1..<100))", name: "Fight-u clobbu", posterPath: PreviewData.Poster.posterPath, backdropPath: PreviewData.Poster.backdropPath, overview: PreviewData.Poster.overview)
        }
    }
}
