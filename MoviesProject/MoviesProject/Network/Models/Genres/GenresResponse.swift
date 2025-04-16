//
//  GenresResponse.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 15.4.25.
//

class GenresResponse: Decodable {
    var genres: [ContentGenre]
    
    init(genres: [ContentGenre]) {
        self.genres = genres
    }
    
    enum CodingKeys: String, CodingKey {
        case genres
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.genres = try container.decode([ContentGenre].self, forKey: .genres)
    }
}


struct ContentGenre: Decodable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
