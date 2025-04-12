//
//  URLSessionClient.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import Foundation

class URLSessionClient: APIClient, HasAuthentication {
    let baseURL: String
    let decoder: JSONDecoder
    let accessToken: String

    init(
        baseURL: String = BaseEnvironment.baseURL,
        decoder: JSONDecoder = JSONDecoder(),
        accessToken: String = BaseEnvironment.accessToken
    ) {
        self.baseURL = baseURL
        self.decoder = decoder
        self.accessToken = accessToken
    }

    var headers: [String: String] {
        return [
            "Accept": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
    }
    
    func dataRequest<T: Decodable>(
        _ path: String,
        method: HTTPMethod,
        parameters: [String: Any]? = nil,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> T {
        var components = URLComponents(string: baseURL + path)
        if let queryItems = queryItems {
            components?.queryItems = queryItems
        }
        
        guard let url = components?.url else {
            print("🔌 Data request \(method.rawValue) \(baseURL)\(path) ❌ Bad URL \(components?.debugDescription ?? "nil")")
            throw NetworkError.badUrl
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }

        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                print("🔌 Data request \(method.rawValue) \(url.absoluteString) ❌ bad status")
                throw NetworkError.badStatusCode
            }

            do {
                let decoded = try self.decoder.decode(T.self, from: data)
                print("🔌 Data request \(method.rawValue) \(url.absoluteString) ✅")
                return decoded
            } catch {
                print("🔌 Data request \(method.rawValue) \(url.absoluteString) ❌ decoding")
                throw NetworkError.decoding
            }

        } catch {
            print("🔌 Data request \(method.rawValue) \(url.absoluteString) ❌ error \(error.localizedDescription)")
            throw NetworkError.error(error)
        }
    }
}
