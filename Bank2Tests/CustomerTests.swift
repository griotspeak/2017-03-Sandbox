//
//  CustomerTests.swift
//  Bank2
//
//  Created by TJ Usiyan on 2017/04/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Bank2

class CustomerTests: XCTestCase {
    func testMarthaStewart() {
        let result = Customer(givenName: "Martha", familyName: "Stewart", email: "martha@stewart.com")
        XCTAssertEqual(result.givenName, "Martha")
        XCTAssertEqual(result.familyName, "Stewart")
        XCTAssertEqual(result.email, "martha@stewart.com")
    }

    func testSerializeToJSON() {
        let expectedFamily = "Stewart"
        let expectedGiven = "Martha"
        let expectedEmail = "martha@stewart.com"

        let customer = Customer(givenName: expectedGiven,
                                familyName: expectedFamily,
                                email: expectedEmail)
        let result = customer.jsonObject


        if let resultEmail = result[Customer.emailKey] as? String,
            let resultFamily = result[Customer.familyNameKey] as? String,
            let resultGiven = result[Customer.givenNameKey] as? String {
            XCTAssertEqual(resultEmail, expectedEmail)
            XCTAssertEqual(resultGiven, expectedGiven)
            XCTAssertEqual(resultFamily, expectedFamily)
        } else {
            XCTFail("failed to extract value(s) for JSON Keys")
        }
    }
}
