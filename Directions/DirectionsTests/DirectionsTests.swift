//
//  DirectionsTests.swift
//  DirectionsTests
//
//  Created by TJ Usiyan on 2017/03/31.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Directions

class DirectionsTests: XCTestCase {
    
    func testTurnLeftFromFacingNorth() {

        let result = turn(.left, fromFacing: .north)
        let expected: CardinalDirection = .west

        XCTAssertEqual(result, expected)
    }

    func testTurnRightFromFacingNorth() {

        let result = turn(.right, fromFacing: .north)
        let expected: CardinalDirection = .east

        XCTAssertEqual(result, expected)
    }

    func testTurnLeftFromFacingSouth() {

        let result = turn(.left, fromFacing: .south)
        let expected: CardinalDirection = .east

        XCTAssertEqual(result, expected)
    }

    func testTurnRightFromFacingSouth() {

        let result = turn(.right, fromFacing: .north)
        let expected: CardinalDirection = .west

        XCTAssertEqual(result, expected)
    }

    func testTurnLeftFromFacingEast() {

        let result = turn(.left, fromFacing: .east)
        let expected: CardinalDirection = .north

        XCTAssertEqual(result, expected)
    }

    func testTurnRightFromFacingEast() {

        let result = turn(.right, fromFacing: .east)
        let expected: CardinalDirection = .south

        XCTAssertEqual(result, expected)
    }

    func testTurnLeftFromFacingWest() {

        let result = turn(.left, fromFacing: .west)
        let expected: CardinalDirection = .south

        XCTAssertEqual(result, expected)
    }

    func testTurnRightFromFacingWest() {

        let result = turn(.right, fromFacing: .west)
        let expected: CardinalDirection = .north

        XCTAssertEqual(result, expected)
    }
}
