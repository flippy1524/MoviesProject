//
//  NetworkError.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 12.4.25.
//

import Foundation


public enum NetworkError: Error {
    case error(Error)
    case badUrl
    case decoding
    case badStatusCode
}
