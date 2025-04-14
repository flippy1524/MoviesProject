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
    var title: String

    enum CodingKeys: String, CodingKey {
        case id
        case title = "title"
    }

    init(
        id: Int,
        title: String
    ) {
        self.id = id
        self.title = title
    }

    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: try container.decode(Int.self, forKey: .id),
            title: try container.decode(String.self, forKey: .title)
        )
    }
}