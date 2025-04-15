//
//  TVDetails.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//


import SwiftData

@Model
class TVDetails: Decodable {
    @Attribute(.unique) var id: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }

    init(
        id: Int,
        name: String
    ) {
        self.id = id
        self.name = name
    }

    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: try container.decode(Int.self, forKey: .id),
            name: try container.decode(String.self, forKey: .name)
        )
    }
}
