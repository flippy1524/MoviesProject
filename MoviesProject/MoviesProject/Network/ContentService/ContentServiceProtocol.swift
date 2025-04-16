//
//  ContentServiceProtocol.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//


protocol ContentServiceProtocol {
    // Fetch movies based on a category (e.g., now playing, popular, etc.)
    func fetchMovies(for category: MovieCategory, page: Int) async throws -> ContentResponse
    
    // Fetch movie details by its ID
    func fetchMovieDetails(for id: Int) async throws -> MovieDetails
    
    // Fetch TV details by its ID
    func fetchTVDetails(for id: Int) async throws -> TVDetails
    
    // Fetch genres based on content type (movie or TV)
    func fetchGenres(for type: ContentType) async throws -> GenresResponse
    
    // Fetch search results based on query
    func fetchSearchResults(for type: ContentType, with query: String, page: Int) async throws -> ContentResponse
}