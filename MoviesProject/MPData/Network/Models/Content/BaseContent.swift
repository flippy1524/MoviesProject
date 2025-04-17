//
//  BaseContent.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

public class BaseContent: BaseContentProtocol {
    public var currentPage: Int
    public var contentList: [MPContent]
    public var totalPages: Int?
    
    public init(currentPage: Int, contentList: [MPContent], totalPages: Int? = nil) {
        self.currentPage = currentPage
        self.contentList = contentList
        self.totalPages = totalPages
    }
    
    public var canFetchNextPage : Bool {
        guard !contentList.isEmpty, let totalPages else { return false }
        return currentPage < totalPages
    }
    
    public func updateContent(page: Int, newContent: [MPContent], pages: Int?) {
        currentPage = page
        insertContentWithoutDuplicates(newContent)
        totalPages = pages
    }
    
    public func insertContentWithoutDuplicates(_ newContent: [MPContent]) {
        var currentList = contentList
        currentList.append(contentsOf: newContent)
        var seenIDs = Set<Int>()
        contentList = currentList.reversed().filter { seenIDs.insert($0.id).inserted }.reversed()
    }
}

protocol BaseContentProtocol {
    var currentPage: Int { get }
    var contentList: [MPContent] { get }
    var totalPages: Int? { get }
    var canFetchNextPage: Bool { get }
    func updateContent(page: Int, newContent: [MPContent], pages: Int?)
    func insertContentWithoutDuplicates(_ newContent: [MPContent])
}
