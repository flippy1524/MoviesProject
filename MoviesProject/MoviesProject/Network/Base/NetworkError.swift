//
//  NetworkError.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import Foundation

public enum NetworkError: Error, Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }
    
    case error(Error)
    case badUrl
    case decoding
    case badStatusCode
}
