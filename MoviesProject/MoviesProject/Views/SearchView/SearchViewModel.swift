//
//  SearchViewModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//


import SwiftUI

class SearchViewModel: ObservableObject, SearchViewModelProtocol {
    @Service var manager: SearchManager?
    
    @Published var contentTypes = ContentType.allCases
    @Published var searchContent: SearchContent?
    @Published var selectedContent: ContentDetailsData?
    @Published var selectedType: ContentType = .movie {
        didSet {
            handle(.changedType)
        }
    }
    @Published var searchText: String = "" {
        didSet {
            handle(.search)
        }
    }
    var timer: Foundation.Timer?
}

//MARK: Public methods

extension SearchViewModel {
    func handle(_ action: SearchModel.Action) {
        switch action {
        case .search:
            scheduleSearch()
        case .fetchNextPage:
            fetchNextPage()
        case .showDetails(let content):
            showDetails(for: content)
        case .changedType:
            handle(.search)
        }
    }
}

//MARK: Computed variables

extension SearchViewModel {
    var canSearch: Bool {
        return !searchText.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var title: String? {
        guard let list = searchContent?.contentList, list.isEmpty else {
            return nil
        }
        
        return Localized.Search.noResults
    }
    
    var contentList: [MPContent] {
        return searchContent?.contentList ?? []
    }
    
    var showContent: Bool {
        return !contentList.isEmpty || title != nil
    }
}

//MARK: Private methods

extension SearchViewModel {
    private func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func scheduleSearch() {
        let query = searchText
        invalidateTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0,
                                     repeats: false,
                                     block: { [weak self] (timer) in
            print("searching with", query)
            guard let self = self, self.canSearch else {
                self?.searchContent = nil
                return
            }
            self.performSearch(with: query)
        })
    }
    
    private func performSearch(with query: String) {
        Task {
            do {
                if let searchContent = try await manager?.getSearchContent(for: selectedType, with: query) {
                    DispatchQueue.main.async {
                        self.searchContent = nil
                        self.searchContent = searchContent
                    }
                }
            } catch {
                print("Error fetching search results: \(error)")
                
            }
        }
    }
    
    private func fetchNextPage() {
        guard let searchContent = searchContent, searchContent.canFetchNextPage, canSearch else { return }
        
        invalidateTimer()
        Task {
            do {
                if let newContent = try await manager?.getSearchContent(for: selectedType, with: searchText, page: searchContent.currentPage + 1) {
                    DispatchQueue.main.async {
                        searchContent.updateContent(page: newContent.currentPage, newContent: newContent.contentList, pages: newContent.totalPages)
                        self.searchContent = searchContent
                    }
                }
            } catch {
                print("Error fetching next page: \(error)")
            }
        }
    }
    
    private func showDetails(for content: MPContent) {
        let type = selectedType
        selectedContent = content.contentDetailsData(for: type)
    }
}
