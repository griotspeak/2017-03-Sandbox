//
//  Bank2Tests.swift
//  Bank2Tests
//
//  Created by TJ Usiyan on 2017/04/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import Bank2

class Bank2Tests: XCTestCase {
    func testRoundTripToJSON() {
        let bank = Bank(address: "123 Main St, Pleasantville, PA, 99999",
                        accountsDirectory: [:], employees: [])
        let result = Bank(jsonObject: bank.jsonObject)
        XCTAssertEqual(result, bank)
    }
}


//let expectedAddress = "123 Main St, Pleasantville, PA, 99999"
//let expectedAccountsDirectory: [String:[String:Any]] = [:]
//let expectedEmployees: [String:Any] = [:]
//let expected: [String:Any] = [
//    "address" : expectedAddress,
//    "accounts_directory" : expectedAccountsDirectory,
//    "employees" : expectedEmployees
//]
//
//if let resultAddress = result["address"] as? String,
//    let resultDirectory = result["accounts_directory"] as? [String: [String: Any]],
//    let resultEmployees = result["employees"] as? [String:Any] {
//
//
//}
