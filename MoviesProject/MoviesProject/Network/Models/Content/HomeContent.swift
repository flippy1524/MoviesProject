//  HomeContent
//
//  Created by Ivan Velkov on 12.4.25.
//


class HomeContent: BaseContent, HomeContentProtocol {
    var category: MovieCategory
    
    init(category: MovieCategory, currentPage: Int, contentList: [MPContent], totalPages: Int? = nil) {
        self.category = category
        super.init(currentPage: currentPage, contentList: contentList, totalPages: totalPages)
    }
    
    var title: String {
        category.title
    }
}

fileprivate protocol HomeContentProtocol {
    var category: MovieCategory { get }
    var title: String { get }
}
