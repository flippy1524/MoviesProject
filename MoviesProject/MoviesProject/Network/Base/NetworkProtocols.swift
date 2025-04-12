//
//  NetworkProtocols.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//


import Foundation

protocol APIClient {
    func dataRequest<T: Decodable>(
        _ path: String,
        method: HTTPMethod,
        parameters: [String: Any]?,
        queryItems: [URLQueryItem]?
    ) async throws -> T
    
    var baseURL: String { get }
    var decoder: JSONDecoder { get }
}

protocol HasAuthentication {
    var accessToken: String { get }
}

protocol NetworkService {
    var api: URLSessionClient { get }
}

enum HTTPMethod: String {
    case get = "GET"
}
