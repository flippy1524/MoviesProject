//
//  URLSessionClient.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import Foundation

class URLSessionClient: APIClient, HasAuthentication, APIMethods {
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
}

//MARK: Public methods

extension URLSessionClient {
    func dataRequest<T: Decodable>(
        _ path: String,
        method: HTTPMethod,
        parameters: [String: Any]? = nil,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> T {
        do {
            let url = try generateURL(with: path, queryItems: queryItems)
            let request = generateRequest(with: url, method: method, parameters: parameters)
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                print("🔌 Data request \(method.rawValue) \(url.absoluteString) ❌ bad status")
                throw NetworkError.badStatusCode
            }
            
            let decoded: T = try decode(data)
            print("🔌 Data request \(method.rawValue) \(url.absoluteString) ✅")
            return decoded
        } catch {
            throw error
        }
    }
}


//MARK: Private methods

fileprivate extension URLSessionClient {
    func generateRequest(with url: URL, method: HTTPMethod, parameters: [String : Any]?) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        }
        return request
    }
    
    func generateURL(with path: String, queryItems: [URLQueryItem]?) throws -> URL {
        var components = URLComponents(string: baseURL + path)
        if let queryItems = queryItems {
            components?.queryItems = queryItems
        }
        guard let url = components?.url else {
        print("🔌 Data request \(baseURL)\(path) ❌ Bad URL \(components?.debugDescription ?? "nil")")
            throw NetworkError.badUrl
        }
        return url
    }
    
    func decode<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try self.decoder.decode(T.self, from: data)
        } catch let decodingError as DecodingError {
            print("🔌 Decoding error for \(T.self):")
            switch decodingError {
            case .typeMismatch(let type, let context):
                print("❌ Type mismatch: \(type) – \(context.debugDescription)")
                print("   Coding path: \(context.codingPath)")
            case .valueNotFound(let type, let context):
                print("❌ Value not found: \(type) – \(context.debugDescription)")
                print("   Coding path: \(context.codingPath)")
            case .keyNotFound(let key, let context):
                print("❌ Key '\(key)' not found – \(context.debugDescription)")
                print("   Coding path: \(context.codingPath)")
            case .dataCorrupted(let context):
                print("❌ Data corrupted – \(context.debugDescription)")
                print("   Coding path: \(context.codingPath)")
            @unknown default:
                print("❌ Unknown decoding error: \(decodingError)")
            }
            throw NetworkError.decoding
        }
    }
    
    var headers: [String: String] {
        return [
            "Accept": "application/json",
            "Authorization": "Bearer \(accessToken)"
        ]
    }
}

private protocol APIMethods {
    func generateURL(with path: String, queryItems: [URLQueryItem]?) throws -> URL
    func generateRequest(with url: URL, method: HTTPMethod, parameters: [String: Any]?) -> URLRequest
    func decode<T: Decodable>(_ data: Data) throws -> T
    var headers: [String: String] { get }
}
