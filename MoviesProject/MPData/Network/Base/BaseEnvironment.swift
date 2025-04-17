//
//  BaseEnvironment.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import Foundation

public enum BaseEnvironment {
    public static var baseURL: String {
        return Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String ?? "https://localhost/"
    }
    
    public static var accessToken: String {
        return Bundle.main.object(forInfoDictionaryKey: "ACCESS_TOKEN") as? String ?? ""
    }
}
