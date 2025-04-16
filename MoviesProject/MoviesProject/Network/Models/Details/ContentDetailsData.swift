//
//  ContentDetailsData.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 15.4.25.
//

import Foundation

struct ContentDetailsData: Codable, Hashable {
    let id: Int
    let type: ContentType
    let title: String?
    let posterPath: String?
    let backdropPath: String?
    let overview: String?
}
