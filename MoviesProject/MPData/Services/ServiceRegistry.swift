//
//  ServiceRegistry.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//


import Foundation

public struct ServiceRegistry {
   
    private init() {}
    
    static var urlSessionClient: URLSessionClient {
        return URLSessionClient()
    }
    
    public static func registerServices() {
        let contentmanager = ContentManager(service: ContentService(api: urlSessionClient))
        ServiceContainer.register(ContentManager.self, with: contentmanager)
        let searchManager = SearchManager(service: ContentService(api: urlSessionClient))
        ServiceContainer.register(SearchManager.self, with: searchManager)
        let cacheManager = CacheManager()
        ServiceContainer.register(CacheManager.self, with: cacheManager)
    }
}
