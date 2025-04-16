//
//  SearchModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import Foundation

enum SearchModel {
    enum Action {
        case search
        case fetchNextPage
        case changedType
        case showDetails(content: MPContent)
    }
}

protocol SearchViewModelProtocol: ObservableObject {
    var contentTypes: [ContentType] { get set }
    var searchContent: SearchContent? { get set }
    var selectedContent: ContentDetailsData? { get set }
    var selectedType: ContentType { get set }
    var searchText: String { get set }
    
    func handle(_ action: SearchModel.Action)
    var canSearch: Bool { get }
    var title: String? { get }
    var contentList: [MPContent] { get }
    var showContent: Bool { get }
}

