//  HomeContent
//
//  Created by Ivan Velkov on 12.4.25.
//

class SearchContent: BaseContent, SearchContentProtocol
{
    var type: ContentType
    
    init(type: ContentType, currentPage: Int, contentList: [MPContent], totalPages: Int? = nil) {
        self.type = type
        super.init(currentPage: currentPage, contentList: contentList, totalPages: totalPages)
    }
}

fileprivate protocol SearchContentProtocol {
    var type: ContentType { get}

}
