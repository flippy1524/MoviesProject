//
//  Movie.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import SwiftData

@Model
class Movie: Decodable {
    @Attribute(.unique) var id: Int
    var title: String
    var posterPath: String
    var backdropPath: String
    var overview: String

    enum CodingKeys: String, CodingKey {
        case id, overview
        case title = "original_title"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }

    init(
        id: Int,
        title: String,
        posterPath: String,
        backdropPath: String,
        overview: String
    ) {
        self.id = id
        self.title = title
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.overview = overview
    }

    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: try container.decode(Int.self, forKey: .id),
            title: try container.decode(String.self, forKey: .title),
            posterPath: try container.decode(String.self, forKey: .posterPath),
            backdropPath: try container.decode(String.self, forKey: .backdropPath),
            overview: try container.decode(String.self, forKey: .overview)
        )
    }
}
