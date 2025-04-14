//
//  SearchManager.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//


import Foundation
import SwiftData

class SearchManager {
    
    private var service: ContentService
    private var modelContainer: ModelContainer
    
    init(service: ContentService, modelContainer: ModelContainer) {
        self.service = service
        self.modelContainer = modelContainer
    }
    
    
    

    
    func getSearchResults(for category: ContentType, with query: String, page: Int = 1) async throws -> ContentResponse {
        return try await service.fetchSearchResults(for: category, with: query, page: page)
    }
}


