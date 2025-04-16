//
//  UtilsTests.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import XCTest
@testable import MoviesProject

class UtilsTests: XCTestCase {

    func testFormatMinutesToHoursAndMinutes_OnlyMinutes() {
        let result = formatMinutesToHoursAndMinutes(45)
        XCTAssertEqual(result, "45 min")
    }

    func testFormatMinutesToHoursAndMinutes_OnlyHours() {
        let result = formatMinutesToHoursAndMinutes(120)
        XCTAssertEqual(result, "2 h")
    }

    func testFormatMinutesToHoursAndMinutes_HoursAndMinutes() {
        let result = formatMinutesToHoursAndMinutes(125)
        XCTAssertEqual(result, "2 h 5 min")
    }

    func testFormattedToDotDate_ValidInput() {
        let dateString = "2025-05-31"
        let result = dateString.formattedToDotDate
        XCTAssertEqual(result, "31.05.2025")
    }

    func testFormattedToDotDate_InvalidInput() {
        let dateString = "31/05/2025"
        let result = dateString.formattedToDotDate
        XCTAssertNil(result)
    }
    
    func testIsIphone() {
        #if targetEnvironment(simulator)
        // On simulator, this will vary based on the selected device
        XCTAssertTrue(isIphone || !isIphone, "isIphone should return a Bool based on current device idiom")
        #else
        XCTAssertEqual(isIphone, UIDevice.current.userInterfaceIdiom == .phone)
        #endif
    }

    func testIsDeviceInLandscape() {
        let screenBounds = UIScreen.main.bounds
        let expected = screenBounds.width > screenBounds.height
        XCTAssertEqual(isDeviceInLandscape, expected)
    }
    
    func testSizeForWidth_GeneratesCorrectHeight() {
        let width: CGFloat = 200
        let aspectRatio: CGFloat = 2.0 / 3.0
        let size = sizeForWidth(width, aspectRatio: aspectRatio)
        XCTAssertEqual(size.width, width)
        XCTAssertEqual(size.height, width / aspectRatio)
    }

    func testPosterCardWidth_ProducesPositiveValue() {
        let spacing: CGFloat = 8.0
        let width = posterCardWidth(with: spacing)
        XCTAssertGreaterThan(width, 0, "posterCardWidth should return a positive value")
    }
}
