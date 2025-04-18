//
//  ContentManager.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import Foundation

protocol ContentManagerProtocol {
    func getAllCategories() async throws -> [HomeContent]
    func fetchGenres() async
    func getGenres(for type: ContentType, list: [Int]) -> [ContentGenre]
    func getHomeContent(for category: MovieCategory, page: Int) async throws -> HomeContent
    func getMovieDetails(for id: Int) async throws -> MovieDetails
    func getTVDetails(for id: Int) async throws -> TVDetails
    func getMovieGenres() async throws -> MovieGenres
    func getTVGenres() async throws -> TVGenres
    func getMovies(for category: MovieCategory, page: Int) async throws -> ContentResponse
    func getGenres(for type: ContentType) async throws -> GenresResponse
}

public class ContentManager: BaseServiceManager {
    private var movieGenres: MovieGenres?
    private var tvGenres: TVGenres?
}

//MARK: Public methods

extension ContentManager: ContentManagerProtocol {
    public func getAllCategories() async throws -> [HomeContent] {
        async let category1Movies = getHomeContent(for: .nowPlaying)
        async let category2Movies = getHomeContent(for: .popular)
        async let category3Movies = getHomeContent(for: .topRated)
        async let category4Movies = getHomeContent(for: .upcoming)
        
        return try await [category1Movies, category2Movies, category3Movies, category4Movies]
    }
    
    ///would be used on the data from the home screen, not used in the current state
    public func fetchGenres() async {
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
    public func getGenres(for type: ContentType, list: [Int]) -> [ContentGenre] {
        let array: [ContentGenre]
        switch type {
        case .movie:
            array = movieGenres?.genres.filter({list.contains($0.id)}) ?? []
        case .tv:
            array = tvGenres?.genres.filter({list.contains($0.id)}) ?? []
        }
        return array
    }
    
    public func getHomeContent(for category: MovieCategory, page: Int = 1) async throws -> HomeContent {
        let response = try await getMovies(for: category, page: page)
        return HomeContent(category: category, currentPage: response.page, contentList: response.results, totalPages: response.totalPages)
    }
    
    public func getMovieDetails(for id: Int)  async throws -> MovieDetails {
        return try await service.fetchMovieDetails(for: id)
    }
    
    public func getTVDetails(for id: Int) async throws -> TVDetails {
        return try await service.fetchTVDetails(for: id)
    }
}

//MARK: Private methods

extension ContentManager {
    internal func getMovieGenres() async throws -> MovieGenres {
        return try await MovieGenres(genres: getGenres(for: .movie).genres)
    }
    
    internal func getTVGenres() async throws -> TVGenres {
        return try await TVGenres(genres: getGenres(for: .tv).genres)
    }
    
    internal func getMovies(for category: MovieCategory, page: Int) async throws -> ContentResponse {
        return try await service.fetchMovies(for: category, page: page)
    }
    
    internal func getGenres(for type: ContentType) async throws -> GenresResponse {
        return try await service.fetchGenres(for: type)
    }
}
