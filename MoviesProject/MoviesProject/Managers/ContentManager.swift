//
//  ContentManager.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import Foundation
import SwiftData

class ContentManager {
    
    private var service: ContentService
    private var modelContainer: ModelContainer
    
    init(service: ContentService, modelContainer: ModelContainer) {
        self.service = service
        self.modelContainer = modelContainer
    }
    
    func getAllCategories() async throws -> [HomeContent] {
        async let category1Movies = getHomeContent(for: .nowPlaying)
        async let category2Movies = getHomeContent(for: .popular)
        async let category3Movies = getHomeContent(for: .topRated)
        async let category4Movies = getHomeContent(for: .upcoming)
        
        return try await [category1Movies, category2Movies, category3Movies, category4Movies]
    }
    
    func getHomeContent(for category: MovieCategory, page: Int = 1) async throws -> HomeContent {
        let response = try await getMovies(for: category, page: page)
        //TODO: incorporate caching here cache the data here or return the cached data if the endpoint fails 
        return HomeContent(category: category, currentPage: response.page, contentList: response.results, totalPages: response.totalPages)
    }
    
    private func getMovies(for category: MovieCategory, page: Int = 1) async throws -> ContentResponse {
        return try await service.fetchMovies(for: category, page: page)
    }
}
