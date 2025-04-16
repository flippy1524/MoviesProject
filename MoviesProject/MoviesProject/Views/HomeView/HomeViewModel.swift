//
//  HomeViewModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Service var manager: ContentManager?
    
    @Published var homeContentList: [HomeContent] = []
    @Published var hasFetched = false
    @Published var selectedMovie: ContentDetailsData?
}


//MARK: Public methods
extension HomeViewModel: HomeViewModelProtocol {
    func handle(_ action: HomeModel.Action) {
        switch action {
        case .fetchCategories:
            fetchCategories()
        case .fetchNextPage(let homeContent):
            fetchNextPage(for: homeContent)
        case .showDetails(movie: let movie):
            showDetails(for: movie)
        }
    }
}

//MARK: Private methods
extension HomeViewModel {
    private func showDetails(for movie: MPContent) {
        selectedMovie = movie.contentDetailsData(for: .movie)
    }
    
    private func fetchCategories() {
        guard !hasFetched else { return }
        
        Task {
            do {
                let fetchedCategories = try await manager?.getAllCategories() ?? []
                
                DispatchQueue.main.async {
                    self.homeContentList = fetchedCategories
                    self.hasFetched = true
                }
            } catch {
                print("Error fetching categories: \(error)")
            }
        }
    }
    
    private func fetchNextPage(for homeContent: HomeContent) {
        guard homeContent.canFetchNextPage else { return }
        
        Task {
            do {
                if let newContent = try await manager?.getHomeContent(for: homeContent.category, page: homeContent.currentPage + 1) {
                    DispatchQueue.main.async {
                        homeContent.updateContent(page: newContent.currentPage, newContent: newContent.contentList, pages: newContent.totalPages)
                    }
                }
            } catch {
                print("Error fetching home content: \(error)")
            }
        }
    }
}
