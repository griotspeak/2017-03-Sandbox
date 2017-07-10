//
//  BankTest.swift
//  BankCrystal
//
//  Created by TJ Usiyan on 2017/07/10.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import XCTest
@testable import BankCrystal

class BankTests: XCTestCase {
    func testAddress() {
        let bank = Bank(address: "123 Main St")
        let result = bank.address
        let expected = "123 Main St"
        XCTAssertEqual(result, expected)
    }

    func testHasEmptyEmployeeListByDefault() {
        let bank = Bank(address: "123 Main St")
        XCTAssertTrue(bank.employees.isEmpty)
    }

    func testCreateWithEmployeeList() {
        let list: Set<Employee> = [
            Employee(givenName: "Peppa", familyName: "Pig", email: "peppa@pig.com"),
            Employee(givenName: "George", familyName: "Pig", email: "george@pig.com"),
            Employee(givenName: "Mummy", familyName: "Pig", email: "mummy@pig.com"),
        ]
        let bank = Bank(address: "123 Main St", employees: list)
        XCTAssertEqual(bank.employees, list)
    }

    func testHasEmptyCustomerListByDefault() {
        let bank = Bank(address: "123 Main St")
        XCTAssertTrue(bank.customers.isEmpty)
    }

    func testCreateWithCustomerList() {
        let list: Set<Customer> = [
            Customer(givenName: "Peppa", familyName: "Pig", email: "peppa@pig.com"),
            Customer(givenName: "George", familyName: "Pig", email: "george@pig.com"),
            Customer(givenName: "Mummy", familyName: "Pig", email: "mummy@pig.com"),
            ]

        var sourceDirectory: [Customer: Set<BankAccount>] = [:]
        for customer in list {
            sourceDirectory[customer] = []
        }


        let bank = Bank(address: "123 Main St", directory: sourceDirectory)
        XCTAssertEqual(bank.customers, list)
    }

    func testAddNewCustomer() {
        let bank = Bank(address: "123 Main St")
        let customer = Customer(givenName: "Peppa", familyName: "Pig", email: "peppa@pig.com")

        XCTAssertTrue(bank.customers.isEmpty)
        XCTAssertTrue(bank.add(customer: customer))
        XCTAssertEqual(bank.customers, [customer])
    }


    func testCannotAddSameCustomer() {
        let bank = Bank(address: "123 Main St")
        let customer = Customer(givenName: "Peppa", familyName: "Pig", email: "peppa@pig.com")

        XCTAssertTrue(bank.add(customer: customer))
        XCTAssertEqual(bank.customers, [customer])
        XCTAssertFalse(bank.add(customer: customer))
    }

    func testAddNewEmployee() {
        let bank = Bank(address: "123 Main St")
        let employee = Employee(givenName: "Peppa", familyName: "Pig", email: "peppa@pig.com")

        XCTAssertTrue(bank.employees.isEmpty)
        XCTAssertTrue(bank.add(employee: employee))
        XCTAssertEqual(bank.employees, [employee])

    }

    func testCannotAddSameEmployee() {
        let bank = Bank(address: "123 Main St")
        let employee = Employee(givenName: "Peppa", familyName: "Pig", email: "peppa@pig.com")

        XCTAssertTrue(bank.add(employee: employee))
        XCTAssertEqual(bank.employees, [employee])
        XCTAssertFalse(bank.add(employee: employee))
    }

    func testAddAccountForExistingCustomer() {
        let customer = Customer(givenName: "Peppa", familyName: "Pig", email: "peppa@pig.com")
        let directory: [Customer:Set<BankAccount>] = [customer : []]
        let bank = Bank(address: "123 Main St", directory: directory)

        XCTAssertEqual(bank.directory[customer], [])

        guard let result = bank.addAccount(type: .checking, customer: customer) else {
            XCTFail("failed to add account with type \(BankAccount.AccountType.checking) for customer \(customer)")
            return
        }
        XCTAssertEqual(bank.directory[customer], [result])
        XCTAssertNotNil(result)
        XCTAssertEqual(result.accountType, .checking)
        XCTAssertEqual(result.balance, 0)
    }


}
