//
//  AccountTests.swift
//  Bank2
//
//  Created by TJ Usiyan on 2017/04/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Bank2

class AccountTests: XCTestCase {
    func testWithdrawal() {
        guard let account = CheckingAccount(deposit: 100.00) else {
            XCTFail("failed to create account with initial deposit")
            return
        }
        XCTAssertEqual(account.balance, 100)
        let success = account.withdraw(amount: 75)
        XCTAssertTrue(success)
        XCTAssertEqual(account.balance, 25)
    }

    func testFailedWithdrawal() {
        guard let account = CheckingAccount(deposit: 100.00) else {
            XCTFail("failed to create account with initial deposit")
            return
        }
        XCTAssertEqual(account.balance, 100)
        let success = account.withdraw(amount: 150)
        XCTAssertFalse(success)
        XCTAssertEqual(account.balance, 100)
    }

    func testSuccesfulDeposit() {
        guard let account = CheckingAccount(deposit: 0.0) else {
            XCTFail("failed to create account with initial deposit")
            return
        }
        XCTAssertEqual(account.balance, 0)
        let success = account.deposit(amount: 150)
        XCTAssertTrue(success)
        XCTAssertEqual(account.balance, 150)
    }
}
