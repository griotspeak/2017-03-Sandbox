//
//  Bank.swift
//  BankCrystal
//
//  Created by TJ Usiyan on 2017/07/10.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

final class Bank {

    let address: String
    var employees: Set<Employee>
    var directory: [Customer : Set<BankAccount>]

    init(address: String,
         directory: [Customer : Set<BankAccount>] = [:],
         employees: Set<Employee> = []) {
        self.address = address
        self.employees = employees
        self.directory = directory
    }
}

extension Bank {
    var customers: Set<Customer> {
        return Set(directory.keys)
    }

    func add(customer: Customer) -> Bool {
        guard customers.contains(customer) == false else {
            return false
        }

        directory[customer] = []

        return true
    }
    func addAccount(type: BankAccount.AccountType, customer: Customer) -> BankAccount? {
        guard var currentAccounts = directory[customer] else {
            return nil
        }

        let newAccount: BankAccount
        switch type {
        case .checking:
            newAccount = CheckingAccount()
        case .savings:
            newAccount = SavingsAccount()
        }

        currentAccounts.insert(newAccount)
        directory[customer] = currentAccounts

        return newAccount
    }


    func add(employee: Employee) -> Bool {
        if employees.contains(employee) {
            return false
        } else {
            employees.insert(employee)
            return true
        }
    }
}
