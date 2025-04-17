//
//  HomeModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

import Foundation
import MPData

enum HomeModel {
    enum Action {
        case fetchCategories
        case fetchNextPage(for: HomeContent)
        case showDetails(movie: MPContent)
    }
}

protocol HomeViewModelProtocol: ObservableObject {
    var homeContentList: [HomeContent] { get set }
    var hasFetched: Bool { get set }
    var selectedMovie: ContentDetailsData? { get set }
    func handle(_ action: HomeModel.Action)
}
