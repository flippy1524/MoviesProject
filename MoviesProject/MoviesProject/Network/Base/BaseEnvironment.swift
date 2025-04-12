//
//  BaseEnvironment.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import Foundation

enum BaseEnvironment {
    static var baseURL: String {
        return Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? "https://localhost/"
    }
    
    static var accessToken: String {
        return Bundle.main.object(forInfoDictionaryKey: "ACCESS_TOKEN") as? String ?? ""
    }
}
