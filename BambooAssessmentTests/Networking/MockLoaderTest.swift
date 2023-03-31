//
//  MockLoaderTest.swift
//  BambooAssessmentTests
//
//  Created by Guru King on 31/03/2023.
//

import XCTest
@testable import BambooAssessment

class MockLoaderTest: XCTestCase {
    
    var mock:Data!

    override func setUp() {
        mock = MockLoader.load(file: "weather")
    }

    override func tearDown() {
        mock = nil
    }

    func testExample() throws {
        XCTAssertTrue(mock != Data())
    }
}
