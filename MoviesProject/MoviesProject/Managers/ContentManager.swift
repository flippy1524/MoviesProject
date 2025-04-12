//
//  ContentManager.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import Foundation

class ContentManager {
    
    private var service: ContentService
    
    init(service: ContentService) {
        self.service = service
    }
    
    
    
    
    func getMovies(for category: MovieCategory, page: Int = 1) async throws -> MovieCategoryList {
        return try await service.fetchMovies(for: category, page: page)
    }
}
