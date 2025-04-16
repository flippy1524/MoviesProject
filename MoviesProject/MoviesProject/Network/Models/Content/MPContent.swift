//
//  Content.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import SwiftData

@Model
class MPContent: Decodable {
    @Attribute(.unique) var id: Int
    var title: String?
    var name: String?
    var posterPath: String?
    var backdropPath: String?
    var overview: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case overview
    }

    init(
        id: Int,
        title: String?,
        name: String?,
        posterPath: String?,
        backdropPath: String?,
        overview: String?
    ) {
        self.id = id
        self.title = title
        self.name = name
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.overview = overview
    }

    
    var posterData: PosterCardData {
        return .init(id: id, title: title ?? name, posterPath: posterPath, overview: overview)
    }
    
    func contentDetailsData(for type: ContentType) -> ContentDetailsData {
        return .init(id: id, type: type, title: title ?? name, posterPath: posterPath, backdropPath: backdropPath, overview: overview)
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: try container.decode(Int.self, forKey: .id),
            title: try container.decodeIfPresent(String.self, forKey: .title),
            name: try container.decodeIfPresent(String.self, forKey: .name),
            posterPath: try container.decodeIfPresent(String.self, forKey: .posterPath),
            backdropPath: try container.decodeIfPresent(String.self, forKey: .backdropPath),
            overview: try container.decodeIfPresent(String.self, forKey: .overview)
        )
    }
}
