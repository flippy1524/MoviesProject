//
//  ContentService.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import Foundation

public class ContentService: NetworkService, HasPageQueryItem {
    var api: URLSessionClient

    init(api: URLSessionClient) {
        self.api = api
    }
}

//MARK: Public methods
extension ContentService: ContentServiceProtocol {
    func fetchMovies(for category: MovieCategory, page: Int) async throws -> ContentResponse {
        let item = pageQueryItem(page)
        return try await api.dataRequest(category.path, method: .get, queryItems: [item])
    }
    
    func fetchSearchResults(for type: ContentType, with searchQuery: String, page: Int) async throws -> ContentResponse {
        let items = [
            queryItem("query", value: searchQuery),
            queryItem("include_adult", value: "false"),
            pageQueryItem(page)
        ]
        return try await api.dataRequest(type.searchPath, method: .get, queryItems: items)
    }
    
    func fetchGenres(for type: ContentType) async throws -> GenresResponse {
        return try await api.dataRequest(type.genrePath, method: .get)
    }
    
    func fetchMovieDetails(for id: Int) async throws -> MovieDetails {
        let path = NetworkPaths.V3.Details.movie(id: id)
        return try await api.dataRequest(path, method: .get)
    }
    
    func fetchTVDetails(for id: Int) async throws -> TVDetails {
        let path = NetworkPaths.V3.Details.tv(id: id)
        return try await api.dataRequest(path, method: .get)
    }
}

//MARK: Private methods
extension ContentService {
    internal func pageQueryItem(_ page: Int) -> URLQueryItem {
        queryItem("page", value: String(page))
    }
    
    internal func queryItem(_ key: String, value: String) -> URLQueryItem {
        URLQueryItem(name: key, value: value)
    }
}


