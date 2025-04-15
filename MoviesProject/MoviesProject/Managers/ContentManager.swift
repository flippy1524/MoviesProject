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
    
    
    private var movieGenres: MovieGenres?
    private var tvGenres: TVGenres?
    
    init(service: ContentService, modelContainer: ModelContainer) {
        self.service = service
        self.modelContainer = modelContainer
    }
}

//MARK: Public methods

extension ContentManager {
    func getAllCategories() async throws -> [HomeContent] {
        async let category1Movies = getHomeContent(for: .nowPlaying)
        async let category2Movies = getHomeContent(for: .popular)
        async let category3Movies = getHomeContent(for: .topRated)
        async let category4Movies = getHomeContent(for: .upcoming)
        
        return try await [category1Movies, category2Movies, category3Movies, category4Movies]
    }
    
    ///would be used on the data from the home screen, not used in the current state
    func fetchGenres() async {
        async let movieGenresResult = getMovieGenres()
        async let tvGenresResult = getTVGenres()
        
        do {
            movieGenres = try await movieGenresResult
            tvGenres = try await tvGenresResult
        } catch {
            print("Failed to fetch genres:", error)
        }
    }
    
    ///would be used on the data from the home screen
    func getGenres(for type: ContentType, list: [Int]) -> [ContentGenre] {
        let array: [ContentGenre]
        switch type {
        case .movie:
            array = movieGenres?.genres.filter({list.contains($0.id)}) ?? []
        case .tv:
            array = tvGenres?.genres.filter({list.contains($0.id)}) ?? []
        }
        return array
    }
    
    func getHomeContent(for category: MovieCategory, page: Int = 1) async throws -> HomeContent {
        let response = try await getMovies(for: category, page: page)
        return HomeContent(category: category, currentPage: response.page, contentList: response.results, totalPages: response.totalPages)
    }
    
    func getMovieDetails(for id: Int)  async throws -> MovieDetails {
        return try await service.fetchMovieDetails(for: id)
    }
    
    func getTVDetails(for id: Int) async throws -> TVDetails {
        return try await service.fetchTVDetails(for: id)
    }
}

//MARK: Private methods

extension ContentManager {
    private func getMovieGenres() async throws -> MovieGenres {
        return try await MovieGenres(genres: getGenres(for: .movie).genres)
    }
    
    private func getTVGenres() async throws -> TVGenres {
        return try await TVGenres(genres: getGenres(for: .tv).genres)
    }
    
    private func getMovies(for category: MovieCategory, page: Int) async throws -> ContentResponse {
        return try await service.fetchMovies(for: category, page: page)
    }
    
    private func getGenres(for type: ContentType) async throws -> GenresResponse {
        return try await service.fetchGenres(for: type)
    }
}

//MARK: Cache methods

extension ContentManager {
    @MainActor private func fetchFromCache<T: PersistentModel>() throws -> T? {
        let context = modelContainer.mainContext
        let descriptor = FetchDescriptor<T>()
        return try context.fetch(descriptor).first
    }
    
    @MainActor func updateCache<T: PersistentModel>(with value: T) throws {
        let context = modelContainer.mainContext
        context.insert(value)
        try context.save()
    }
}
