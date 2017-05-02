//
//  TransactionTests.swift
//  Bank2
//
//  Created by TJ Usiyan on 2017/05/02.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Bank2

class TransactionTests: XCTestCase {
    func testTransactionDebitAmountForDebit() {
        let transaction = Account.Transaction(amount: -100.00,
                                              userDescription: "food",
                                              vendor: "Publix",
                                              datePosted: nil)

        let result = transaction.debitAmount
        let expected = 100.00
        XCTAssertEqual(result, expected)
    }

    func testTransactionDebitAmountForCredit() {
        let transaction = Account.Transaction(amount: 100.00,
                                              userDescription: "refund for Fyre Festival",
                                              vendor: "Ja Rule",
                                              datePosted: nil)

        let result = transaction.debitAmount
        let expected = -100.00
        XCTAssertEqual(result, expected)
    }

    func testRoundTripToJSON() {
        let transaction = Account.Transaction(amount: 100.00,
                                              userDescription: "refund for Fyre Festival",
                                              vendor: "Ja Rule",
                                              datePosted: nil)

        let result = Account.Transaction(jsonObject: transaction.jsonObject)

        XCTAssertEqual(result, transaction)
    }
}
