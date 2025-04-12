//
//  ContentService.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import Foundation

class ContentService: NetworkService {
    internal var api: URLSessionClient

    init(api: URLSessionClient) {
        self.api = api
    }
    
    
    func fetchMovies(for category: MovieCategory, page: Int) async throws -> MovieCategoryList {
        let item = URLQueryItem(name: "page", value: String(page))

        return try await api.dataRequest(category.path, method: .get, queryItems: [item])
    }
    
    
    
}
