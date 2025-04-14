//  HomeContent
//
//  Created by Ivan Velkov on 12.4.25.
//

import SwiftData

@Model
class HomeContent {
    var category: MovieCategory
    var currentPage: Int
    var contentList: [MPContent]
    var totalPages: Int?
    
    init(category: MovieCategory, currentPage: Int, contentList: [MPContent], totalPages: Int? = nil) {
        self.category = category
        self.currentPage = currentPage
        self.contentList = contentList
        self.totalPages = totalPages
    }
    
    var title : String {
        category.title
    }
    
    var canFetchNextPage : Bool {
        guard let totalPages else { return false }
        return currentPage < totalPages
    }
    
    func updateContent(page: Int, newContent: [MPContent], pages: Int?) {
        currentPage = page
        insertContentWithoutDuplicates(newContent)
        totalPages = pages
    }
    
    private func insertContentWithoutDuplicates(_ newContent: [MPContent]) {
        var currentList = contentList
        currentList.append(contentsOf: newContent)
        var seenIDs = Set<Int>()
        contentList = currentList.reversed().filter { seenIDs.insert($0.id).inserted }.reversed()
    }
}
