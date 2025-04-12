//
//  MovieListResponse.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//


struct MovieCategoryList: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
