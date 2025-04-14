//
//  HomeModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//


enum HomeModel {
    enum Action {
        case fetchCategories
        case fetchNextPage(for: HomeContent)
        case showDetails(movie: MPContent)
    }
}
