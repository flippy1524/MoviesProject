//
//  MovieDetails.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

public class MovieDetails: BaseDetails {
    public let title: String?
    public let runtime: Int?
    public let releaseDate: String?

    public enum CodingKeys: String, CodingKey {
        case title, id
        case runtime
        case releaseDate = "release_date"
        case tagline
        case genres
    }

    public init(id: Int, genres: [ContentGenre]?, title: String?, runtime: Int?, releaseDate: String?, tagline: String?) {
        self.title = title
        self.runtime = runtime
        self.releaseDate = releaseDate
        super.init(id: id, tagline: tagline, genres: genres)
    }
    
    public required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: try container.decode(Int.self, forKey: .id),
            genres: try container.decodeIfPresent([ContentGenre].self, forKey: .genres),
            title: try container.decodeIfPresent(String.self, forKey: .title),
            runtime: try container.decodeIfPresent(Int.self, forKey: .runtime),
            releaseDate: try container.decodeIfPresent(String.self, forKey: .releaseDate),
            tagline: try container.decodeIfPresent(String.self, forKey: .tagline)
        )
    }
}
