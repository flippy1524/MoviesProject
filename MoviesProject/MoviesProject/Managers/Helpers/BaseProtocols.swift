//
//  BaseProtocols.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import Foundation
import SwiftData

protocol ModelCaching {
    @MainActor func fetchFromCache<T: PersistentModel>() throws -> T?
    @MainActor func updateCache<T: PersistentModel>(with value: T) throws
}

