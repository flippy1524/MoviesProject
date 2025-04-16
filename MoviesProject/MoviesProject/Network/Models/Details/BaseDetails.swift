//
//  BaseDetails.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 15.4.25.
//

class BaseDetails: Decodable {
    let id: Int
    let tagline: String?
    let genres: [ContentGenre]?

    enum CodingKeys: String, CodingKey {
        case id
        case tagline
        case genres
    }

    init(id: Int, tagline: String?, genres: [ContentGenre]?) {
        self.id = id
        self.tagline = tagline
        self.genres = genres
    }


    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: try container.decode(Int.self, forKey: .id),
            tagline: try container.decode(String.self, forKey: .tagline),
            genres: try container.decodeIfPresent([ContentGenre].self, forKey: .genres)
        )
    }
    
    var formattedGenres: String? {
        guard let genres = genres, !genres.isEmpty else { return nil }
        
        return genres.compactMap { $0.name }.joined(separator: ", ")
    }
}
