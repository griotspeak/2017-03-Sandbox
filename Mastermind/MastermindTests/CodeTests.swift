//
//  CodeTests.swift
//  Mastermind
//
//  Created by TJ Usiyan on 2017/01/20.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Mastermind

class CodeTests: XCTestCase {
    func testFeedback() {
        let code: Code = [.red, .yellow, .orange, .blue]

        XCTAssertEqual(try! Code.Feedback(guess: [.red, .yellow, .orange, .blue], answer: code), Code.Feedback(perfect: 4, imperfect: 0))
        XCTAssertEqual(try! Code.Feedback(guess: [.red, .yellow, .orange, .green], answer: code), Code.Feedback(perfect: 3, imperfect: 0))
        XCTAssertEqual(try! Code.Feedback(guess: [.red, .yellow, .blue, .orange], answer: code), Code.Feedback(perfect: 2, imperfect: 2))
        XCTAssertEqual(try! Code.Feedback(guess: [.red, .orange, .blue, .yellow,], answer: code), Code.Feedback(perfect: 1, imperfect: 3))
        XCTAssertEqual(try! Code.Feedback(guess: [.purple, .lightGrey, .magenta, .green], answer: code), Code.Feedback(perfect: 0, imperfect: 0))

    }

    func testFeedbackWithRepetition() {
        let code: Code = [.lightGrey, .green, .orange, .orange]
        XCTAssertEqual(try! Code.Feedback(guess: [.orange, .orange, .green, .lightGrey], answer: code), Code.Feedback(perfect: 0, imperfect: 4))
        XCTAssertEqual(try! Code.Feedback(guess: [.lightGrey, .green, .orange, .orange], answer: code), Code.Feedback(perfect: 4, imperfect: 0))
    }


}
