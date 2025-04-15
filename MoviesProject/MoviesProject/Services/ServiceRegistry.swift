//
//  ServiceRegistry.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//


import Foundation
import SwiftData

public struct ServiceRegistry {
   
    private init() {}
    
    static var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            MPContent.self,
            TVDetails.self,
            MovieDetails.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    
    static var urlSessionClient: URLSessionClient {
        return URLSessionClient()
    }
    
    public static func registerServices() {
        let contentmanager = ContentManager(service: ContentService(api: urlSessionClient), modelContainer: sharedModelContainer)
        ServiceContainer.register(ContentManager.self, with: contentmanager)
        let searchManager = SearchManager(service: ContentService(api: urlSessionClient), modelContainer: sharedModelContainer)
        ServiceContainer.register(SearchManager.self, with: searchManager)
    }
}
