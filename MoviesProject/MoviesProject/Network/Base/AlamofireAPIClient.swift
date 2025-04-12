//
//  AlamofireAPIClient.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//


import Alamofire
import Foundation

protocol APIClient {
    func dataRequest<T: Decodable>(
        _ path: String,
        method: HTTPMethod,
        parameters: Parameters?
    ) async throws -> T
    
    var session: Session { get }
      var baseURL: String { get }
      var decoder: JSONDecoder { get }
}

final class AlamofireAPIClient: APIClient {
    let session: Session
    let baseURL: String
    let decoder: JSONDecoder

    init(
        session: Session = .default,
        baseURL: String = BaseEnvironment.baseURL,
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.session = session
        self.baseURL = baseURL
        self.decoder = decoder
    }

    func dataRequest<T: Decodable>(
        _ path: String,
        method: HTTPMethod,
        parameters: Parameters? = nil
    ) async throws -> T {
        let url = baseURL + path

        return try await withCheckedThrowingContinuation { continuation in
            session.request(url, method: method, parameters: parameters)
                .validate()
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        do {
                            let decoded = try self.decoder.decode(T.self, from: data)
                            continuation.resume(returning: decoded)
                        } catch {
                            continuation.resume(throwing: error)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
