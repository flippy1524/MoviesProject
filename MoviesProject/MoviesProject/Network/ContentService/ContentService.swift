//
//  ContentService.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import Foundation

class ContentService: NetworkService, HasPageQueryItem {
    var api: URLSessionClient

    init(api: URLSessionClient) {
        self.api = api
    }
}

//MARK: Public methods
extension ContentService {
    func fetchMovies(for category: MovieCategory, page: Int) async throws -> ContentResponse {
        let item = pageQueryItem(page)
        return try await api.dataRequest(category.path, method: .get, queryItems: [item])
    }
    
    func fetchSearchResults(for type: ContentType, with searchQuery: String, page: Int) async throws -> ContentResponse {
        let items = [
            queryItem("query", value: searchQuery),
            pageQueryItem(page)
        ]
        return try await api.dataRequest(type.searchPath, method: .get, queryItems: items)
    }
}

//MARK: Private methods
extension ContentService {
    func pageQueryItem(_ page: Int) -> URLQueryItem {
        queryItem("page", value: String(page))
    }
    
    func queryItem(_ key: String, value: String) -> URLQueryItem {
        URLQueryItem(name: key, value: value)
    }
}


