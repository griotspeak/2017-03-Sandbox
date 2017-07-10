//
//  BankAccountTests.swift
//  BankCrystal
//
//  Created by TJ Usiyan on 2017/07/10.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import BankCrystal

class BankAccountTests: XCTestCase {
    func testAccountsAreAutomaticallyUnique() {
        let accountA = BankAccount(accountType: .checking)
        let accountB = BankAccount(accountType: .checking)
        XCTAssertNotEqual(accountA, accountB)
    }

    func testAccountTypeIsCorrectOnSubclasses() {
        XCTAssertEqual(CheckingAccount().accountType, .checking)
        XCTAssertEqual(SavingsAccount().accountType, .savings)
    }
}
