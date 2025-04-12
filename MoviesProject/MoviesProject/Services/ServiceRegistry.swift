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
        let moviesService = MoviesService(api: AlamofireAPIClient())
        ServiceContainer.register(MoviesService.self, with: moviesService)
    }
}
