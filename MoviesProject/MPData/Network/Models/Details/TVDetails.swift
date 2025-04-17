//
//  TVDetails.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

public class TVDetails: BaseDetails {
    public let name: String?
    public let firstAirDate: String?
    public let numberOfEpisodes: Int?
    public let numberOfSeasons: Int?

    enum CodingKeys: String, CodingKey {
        case name, id
        case firstAirDate = "first_air_date"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case tagline
        case genres
    }

    public init(
        id: Int,
        tagline: String?,
        genres: [ContentGenre]?,
        name: String?,
        firstAirDate: String?,
        numberOfEpisodes: Int?,
        numberOfSeasons: Int?
    ) {
        self.name = name
        self.firstAirDate = firstAirDate
        self.numberOfEpisodes = numberOfEpisodes
        self.numberOfSeasons = numberOfSeasons
        super.init(id: id, tagline: tagline, genres: genres)
    }

    required convenience public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: try container.decode(Int.self, forKey: .id),
            tagline: try container.decodeIfPresent(String.self, forKey: .tagline),
            genres: try container.decodeIfPresent([ContentGenre].self, forKey: .genres),
            name: try container.decodeIfPresent(String.self, forKey: .name),
            firstAirDate: try container.decodeIfPresent(String.self, forKey: .firstAirDate),
            numberOfEpisodes: try container.decodeIfPresent(Int.self, forKey: .numberOfEpisodes),
            numberOfSeasons: try container.decodeIfPresent(Int.self, forKey: .numberOfSeasons)
        )
    }
}
