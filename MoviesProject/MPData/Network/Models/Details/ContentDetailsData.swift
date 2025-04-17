//
//  ContentDetailsData.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 15.4.25.
//

import Foundation

public struct ContentDetailsData: Codable, Hashable {
    public let id: Int
    public let type: ContentType
    public let title: String?
    public let posterPath: String?
    public let backdropPath: String?
    public let overview: String?
    
    public init(id: Int, type: ContentType, title: String?, posterPath: String?, backdropPath: String?, overview: String?) {
        self.id = id
        self.type = type
        self.title = title
        self.posterPath = posterPath
        self.backdropPath = backdropPath
        self.overview = overview
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.type = try container.decode(ContentType.self, forKey: .type)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        self.overview = try container.decodeIfPresent(String.self, forKey: .overview)
    }
    
    
}
