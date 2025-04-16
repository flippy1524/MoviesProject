//
//  TVGenres.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 15.4.25.
//

class TVGenres: GenresResponse {
    override init(genres: [ContentGenre]) {
        super.init(genres: genres)
    }
    
    required init(from decoder: any Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
