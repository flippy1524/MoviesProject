//
//  MoviesService.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//


class MoviesService {
    private let api: APIClient

    init(api: APIClient) {
        self.api = api
    }
    
    func printapi() {
        print(api.baseURL)
    }

//    func fetchMovies() async throws -> [Movie] {
//        try await api.request("/user", method: .get)
//    }
}
