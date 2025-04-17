//
//  MPFontTypeTests.swift
//  MoviesProjectTests
//
//  Created by Ivan Velkov on 16.4.25.
//

import XCTest
@testable import MoviesProject
import SwiftUICore

class MPFontTypeTests: XCTestCase {

    func testTitleLargeAttributes() {
        let fontType: MPFontType = .titleLarge
        let attributes = fontType.attributes

        XCTAssertEqual(attributes.size, 34)
        XCTAssertEqual(attributes.weight, .bold)
        XCTAssertEqual(attributes.uiWeight, .bold)
    }

    func testTitle1Attributes() {
        let fontType: MPFontType = .title1
        let attributes = fontType.attributes

        XCTAssertEqual(attributes.size, 28)
        XCTAssertEqual(attributes.weight, .medium)
        XCTAssertEqual(attributes.uiWeight, .medium)
    }

    func testBodyAttributes() {
        let fontType: MPFontType = .body
        let attributes = fontType.attributes

        XCTAssertEqual(attributes.size, 16)
        XCTAssertEqual(attributes.weight, .regular)
        XCTAssertEqual(attributes.uiWeight, .regular)
    }

    func testFootnoteAttributes() {
        let fontType: MPFontType = .footnote
        let attributes = fontType.attributes

        XCTAssertEqual(attributes.size, 12)
        XCTAssertEqual(attributes.weight, .regular)
        XCTAssertEqual(attributes.uiWeight, .regular)
    }

    func testFontGeneration() {
        let fontType: MPFontType = .titleLarge
        let font = fontType.font

        XCTAssertEqual(font, Font.system(size: 34, weight: .bold))
    }

    func testUIFontGeneration() {
        let fontType: MPFontType = .titleLarge
        let uiFont = fontType.uiFont

        XCTAssertEqual(uiFont, UIFont.systemFont(ofSize: 34, weight: .bold))
    }
}
