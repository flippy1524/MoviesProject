//
//  BaseServiceManager.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import Foundation
import SwiftData

class BaseServiceManager {
    var service: ContentService
    var modelContainer: ModelContainer
    
    init(service: ContentService, modelContainer: ModelContainer) {
        self.service = service
        self.modelContainer = modelContainer
    }
}

extension BaseServiceManager: ModelCaching {
    @MainActor func fetchFromCache<T: PersistentModel>() throws -> T? {
        let context = modelContainer.mainContext
        let descriptor = FetchDescriptor<T>()
        return try context.fetch(descriptor).first
    }
    
    @MainActor func updateCache<T: PersistentModel>(with value: T) throws {
        let context = modelContainer.mainContext
        context.insert(value)
        try context.save()
    }
}
