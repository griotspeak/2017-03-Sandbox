//
//  PersonTests.swift
//  BankCrystal
//
//  Created by TJ Usiyan on 2017/07/10.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import BankCrystal

class PersonTests: XCTestCase {
    func testFullName() {
        let person = Person(givenName: "Bob", familyName: "Builder", email: "bob@builder.com")
        let result = person.fullName
        let expected = "Bob Builder"
        XCTAssertEqual(result, expected)
    }
}
