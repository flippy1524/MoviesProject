//
//  ContentResponse.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//


struct ContentResponse: Decodable {
    let page: Int
    let results: [MPContent]
    let totalPages: Int?
    let totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
