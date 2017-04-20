//
//  Board.swift
//  ticTacToe
//
//  Created by TJ Usiyan on 2017/04/20.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import ticTacToe

class BoardTests: XCTestCase {
    func testDescriptionOfEmptyBoard() {
        let board = BoardState([:])
        let result = board.description

        let expected: String = {
            var string = ""
            string.append("   |   |   ")
            string.append("---+---+---")
            string.append("   |   |   ")
            string.append("---+---+---")
            string.append("   |   |   ")

            return string
        }()

        XCTAssertEqual(result, expected)
    }

    
}
