//
//  BankAccount.swift
//  BankCrystal
//
//  Created by TJ Usiyan on 2017/07/10.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

class BankAccount {
    public private(set) var balance: Double
    let id: UUID
    let accountType: AccountType

    init(accountType: AccountType, balance: Double = 0, id: UUID = UUID()) {
        self.id = id
        self.accountType = accountType
        self.balance = balance
    }

    enum AccountType {
        case checking
        case savings
    }
}

extension BankAccount : Hashable {
    static func ==(lhs: BankAccount, rhs: BankAccount) -> Bool {
        return lhs.id == rhs.id
    }

    var hashValue: Int {
        return id.hashValue
    }
}

class SavingsAccount: BankAccount {
    init(balance: Double = 0, id: UUID = UUID()) {
        super.init(accountType: .savings, balance: balance, id: id)
    }
}

class CheckingAccount: BankAccount {
    init(balance: Double = 0, id: UUID = UUID()) {
        super.init(accountType: .checking, balance: balance, id: id)
    }
}
