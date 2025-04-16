//
//  AdaptiveStackTests.swift
//  MoviesProjectTests
//
//  Created by Ivan Velkov on 16.4.25.
//

import XCTest
import SwiftUI
@testable import MoviesProject

class AdaptiveStackTests: XCTestCase {
    
    func testVerticalAlignment() {
        let stack = AdaptiveStack(isHorizontal: false, horizontalAlignment: .leading, verticalAlignment: .top) {
            Text("Test 1")
            Text("Test 2")
        }
        
        // Check that the vertical alignment is applied as expected
        let verticalAlignment = stack.verticalAlignment
        XCTAssertEqual(verticalAlignment, .top)
    }

    func testHorizontalAlignment() {
        let stack = AdaptiveStack(isHorizontal: true, horizontalAlignment: .center, verticalAlignment: .center) {
            Text("Test 1")
            Text("Test 2")
        }
        
        // Check that the horizontal alignment is applied as expected
        let horizontalAlignment = stack.horizontalAlignment
        XCTAssertEqual(horizontalAlignment, .center)
    }

    func testSpacing() {
        let stack = AdaptiveStack(isHorizontal: false, horizontalAlignment: .center, verticalAlignment: .center, spacing: 20) {
            Text("Test 1")
            Text("Test 2")
        }
        
        // Check that the spacing is applied correctly
        let spacing = stack.spacing
        XCTAssertEqual(spacing, 20)
    }
    
    func testIsHorizontalTrue() {
        let stack = AdaptiveStack(isHorizontal: true, horizontalAlignment: .center, verticalAlignment: .center) {
            Text("Test 1")
            Text("Test 2")
        }
        
        // Ensure the stack is horizontal
        XCTAssertTrue(stack.isHorizontal)
    }
    
    func testIsHorizontalFalse() {
        let stack = AdaptiveStack(isHorizontal: false, horizontalAlignment: .center, verticalAlignment: .center) {
            Text("Test 1")
            Text("Test 2")
        }
        
        // Ensure the stack is vertical
        XCTAssertFalse(stack.isHorizontal)
    }
}
