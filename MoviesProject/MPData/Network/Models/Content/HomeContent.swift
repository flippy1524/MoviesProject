//  HomeContent
//
//  Created by Ivan Velkov on 12.4.25.
//


public class HomeContent: BaseContent, HomeContentProtocol {
    public var category: MovieCategory
    
    public init(category: MovieCategory, currentPage: Int, contentList: [MPContent], totalPages: Int? = nil) {
        self.category = category
        super.init(currentPage: currentPage, contentList: contentList, totalPages: totalPages)
    }
    
    public var title: String {
        category.title
    }
}

fileprivate protocol HomeContentProtocol {
    var category: MovieCategory { get }
    var title: String { get }
}
