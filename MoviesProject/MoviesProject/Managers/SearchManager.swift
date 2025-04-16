//
//  SearchManager.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

import Foundation
import SwiftData

protocol SearchManagerProtocol {
    func getSearchContent(for type: ContentType, with query: String, page: Int) async throws -> SearchContent
    func getSearchResults(for type: ContentType, with query: String, page: Int) async throws -> ContentResponse
}

class SearchManager: BaseManager {}

//MARK: Public methods

extension SearchManager: SearchManagerProtocol {
    func getSearchContent(for type: ContentType, with query: String, page: Int = 1) async throws -> SearchContent {
        let response = try await getSearchResults(for: type, with: query, page: page)
        return SearchContent(type: type, currentPage: response.page, contentList: response.results, totalPages: response.totalPages)
    }
    
    func getSearchResults(for type: ContentType, with query: String, page: Int) async throws -> ContentResponse {
        return try await service.fetchSearchResults(for: type, with: query, page: page)
    }
}
