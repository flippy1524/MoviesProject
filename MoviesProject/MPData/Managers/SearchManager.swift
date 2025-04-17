//
//  SearchManager.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

import Foundation

protocol SearchManagerProtocol {
    func getSearchContent(for type: ContentType, with query: String, page: Int) async throws -> SearchContent
    func getSearchResults(for type: ContentType, with query: String, page: Int) async throws -> ContentResponse
}

public class SearchManager: BaseServiceManager {}

//MARK: Public methods

extension SearchManager: SearchManagerProtocol {
    public func getSearchContent(for type: ContentType, with query: String, page: Int = 1) async throws -> SearchContent {
        let response = try await getSearchResults(for: type, with: query, page: page)
        return SearchContent(type: type, currentPage: response.page, contentList: response.results, totalPages: response.totalPages)
    }
    
    public func getSearchResults(for type: ContentType, with query: String, page: Int) async throws -> ContentResponse {
        return try await service.fetchSearchResults(for: type, with: query, page: page)
    }
}
