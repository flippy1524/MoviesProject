//
//  ContentResponse.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//


public struct ContentResponse: Decodable {
    let page: Int
    let results: [MPContent]
    let totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
    }
}
