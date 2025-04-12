//
//  BaseEnvironment.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//




enum BaseEnvironment {
    static var baseURL: String {
        #if PRODUCTION
        return "https://api.themoviedb.org/"
        #elseif DEBUG
        return "https://api.themoviedb.org/3"
        #else
        return "https://localhost/"
        #endif
    }
}
