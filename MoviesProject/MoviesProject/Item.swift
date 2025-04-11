//
//  Item.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 11.4.25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
