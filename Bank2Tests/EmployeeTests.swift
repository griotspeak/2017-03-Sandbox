//
//  EmployeeTests.swift
//  Bank2
//
//  Created by TJ Usiyan on 2017/04/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//


import XCTest
@testable import Bank2

class EmployeeTests: XCTestCase {
    func testMarthaStewart() {
        let result = Employee(givenName: "Martha", familyName: "Stewart", telephoneNumber: "867-5309")
        XCTAssertEqual(result.givenName, "Martha")
        XCTAssertEqual(result.familyName, "Stewart")
        XCTAssertEqual(result.telephoneNumber, "867-5309")
    }

    func testSerializeToJSON() {
        let expectedFamily = "Stewart"
        let expectedGiven = "Martha"
        let expectedPhone = "867-5309"

        let employee = Employee(givenName: expectedGiven,
                                familyName: expectedFamily,
                                telephoneNumber: expectedPhone)
        let result = employee.jsonObject


        if let resultPhone = result[Employee.phoneKey] as? String,
            let resultFamily = result[Employee.familyNameKey] as? String,
            let resultGiven = result[Employee.givenNameKey] as? String {
            XCTAssertEqual(resultPhone, expectedPhone)
            XCTAssertEqual(resultGiven, expectedGiven)
            XCTAssertEqual(resultFamily, expectedFamily)
        } else {
            XCTFail("failed to extract value(s) for JSON Keys")
        }
    }

}

