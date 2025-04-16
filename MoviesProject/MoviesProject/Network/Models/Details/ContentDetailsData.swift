//
//  ContentDetailsData.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 15.4.25.
//

import Foundation

struct ContentDetailsData: Hashable {
    let id: Int
    let type: ContentType
    let title: String?
    let backdropPath: String?
    let overview: String?
}
