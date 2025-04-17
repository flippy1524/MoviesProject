//
//  PosterCardData.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

public struct PosterCardData {
    public let title: String?
    public let posterPath: String?
    public let overview: String?
    
    public init(id: Int, title: String?, posterPath: String?, overview: String?) {
        self.title = title
        self.posterPath = posterPath
        self.overview = overview
    }
}
