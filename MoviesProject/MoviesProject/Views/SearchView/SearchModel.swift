//
//  SearchModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//


enum SearchModel {
    enum Action {
        case search
        case fetchNextPage
        case changedType
        case showDetails(content: MPContent)
    }
}
