//
//  BaseServiceManager.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import Foundation

class BaseServiceManager {
    var service: ContentService
    
    init(service: ContentService) {
        self.service = service
    }
}
