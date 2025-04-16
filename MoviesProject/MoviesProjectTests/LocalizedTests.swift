//
//  LocalizedTests.swift
//  MoviesProjectTests
//
//  Created by Ivan Velkov on 11.4.25.
//

import Testing
import XCTest
@testable import MoviesProject

class LocalizedTests: XCTestCase {

    func testHomeTitle() {
        let expected = "Home"
        let result = Localized.Home.title
        XCTAssertEqual(result, expected, "Localized.Home.title should return the correct localized string")
    }

    func testDetailsNumberOfSeasons() {
        let expected = "Seasons: 5"
        let result = Localized.Details.numberOfSeasons(5)
        XCTAssertEqual(result, expected, "Localized.Details.numberOfSeasons should return the correct localized string with arguments")
    }
}
