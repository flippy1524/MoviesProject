//
//  ServiceRegistry.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//


import Foundation


public struct ServiceRegistry {
   
    private init() {}
    
    public static func registerServices() {
        let moviesManager = ContentManager(service: ContentService(api: URLSessionClient()))
        ServiceContainer.register(ContentManager.self, with: moviesManager)
    }
}
