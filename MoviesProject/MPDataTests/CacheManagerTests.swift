//
//  CacheManagerTests.swift
//  MoviesProjectTests
//
//  Created by Ivan Velkov on 16.4.25.
//

import XCTest
@testable import MPData

class CacheManagerTests: XCTestCase {

    var mockUserDefaults: UserDefaults!
    var cacheManager: CacheManager!

    override func setUp() {
        super.setUp()
        mockUserDefaults = UserDefaults(suiteName: "TestSuite")!
        cacheManager = CacheManager(defaults: mockUserDefaults)
    }

    func testSetAndGetFavorite() {
        // Given
        let favorite = ContentDetailsData(id: 1, type: .movie, title: "Test Movie", posterPath: "path/to/poster", backdropPath: "path/to/backdrop", overview: "Test Overview")
        
        // When
        cacheManager.setFavorite(favorite)
        
        // Then
        let retrievedFavorite = cacheManager.getFavorite(for: 1, type: .movie)
        XCTAssertEqual(retrievedFavorite?.id, favorite.id)
        XCTAssertEqual(retrievedFavorite?.title, favorite.title)
    }

    func testRemoveFavorite() {
        // Given
        let favorite = ContentDetailsData(id: 1, type: .movie, title: "Test Movie", posterPath: "path/to/poster", backdropPath: "path/to/backdrop", overview: "Test Overview")
        cacheManager.setFavorite(favorite)
        
        // When
        cacheManager.removeFavorite(favorite)
        
        // Then
        let retrievedFavorite = cacheManager.getFavorite(for: 1, type: .movie)
        XCTAssertNil(retrievedFavorite, "Favorite should be removed from the cache.")
    }

    func testMovieFavorites() {
        // Given
        let favorite = ContentDetailsData(id: 1, type: .movie, title: "Test Movie", posterPath: "path/to/poster", backdropPath: "path/to/backdrop", overview: "Test Overview")
        
        // When
        cacheManager.setFavorite(favorite)
        
        // Then
        let retrievedFavorite = cacheManager.getFavorite(for: 1, type: .movie)
        XCTAssertEqual(retrievedFavorite?.id, favorite.id)
        XCTAssertEqual(retrievedFavorite?.type, .movie)
    }

    func testTvFavorites() {
        // Given
        let favorite = ContentDetailsData(id: 2, type: .tv, title: "Test TV Show", posterPath: "path/to/poster", backdropPath: "path/to/backdrop", overview: "Test Overview")
        
        // When
        cacheManager.setFavorite(favorite)
        
        // Then
        let retrievedFavorite = cacheManager.getFavorite(for: 2, type: .tv)
        XCTAssertEqual(retrievedFavorite?.id, favorite.id)
        XCTAssertEqual(retrievedFavorite?.type, .tv)
    }

    func testMovieFavoritesStorage() {
        // Given
        let movie = ContentDetailsData(id: 3, type: .movie, title: "Stored Movie", posterPath: "path/to/poster", backdropPath: "path/to/backdrop", overview: "Test Overview")
        
        // When
        cacheManager.setFavorite(movie)
        
        // Then
        let storedMovie = cacheManager.getFavorite(for: 3, type: .movie)
        XCTAssertEqual(storedMovie?.title, "Stored Movie")
    }
}
