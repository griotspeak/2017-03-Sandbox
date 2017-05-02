//
//  Account.swift
//  Bank2
//
//  Created by TJ Usiyan on 2017/04/17.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

class Account {
    enum AccountType {
        case checking
        case savings
    }

    let id: UUID
    var transactions: [Transaction]

    var balance: Double {
        fatalError("unimplemented")
    }

    init(transactions: [Transaction] = [], id: UUID = UUID()) {
        self.id = id
        self.transactions = transactions
    }

    convenience init?(deposit: Double, id: UUID = UUID()) {
        fatalError("unimplemented")
    }

    var accountType: AccountType {
        fatalError("Unimplemented in `Account`. Use `CheckingAccount` or `SavingsAccount`.")
    }

    func execute(transaction: Transaction, allowOverdraft: Bool = false) -> Bool {
        fatalError("unimplemented")
    }

    func withdraw(amount: Double) -> Bool {
        fatalError("unimplemented")
    }

    func deposit(amount: Double) -> Bool {
        fatalError("unimplemented")
    }

    struct Transaction : Equatable {
        enum TransactionType {
            /// Debit is amount paid out of account
            case debit
            /// Credit is amount owed to owner of account
            case credit
        }
        let amount: Double
        var userDescription: String?
        let vendor: String
        var datePosted: Date?
        let dateCreated: Date
        static func sanitize(date: Date) -> Date {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
            return calendar.date(from: components)!
        }


        public init(amount: Double,
                    userDescription: String?,
                    vendor: String,
                    datePosted: Date?) {
            self.init(amount: amount,
                      userDescription: userDescription,
                      vendor: vendor,
                      datePosted: datePosted,
                      dateCreated: Date())
        }
        internal init(amount: Double,
                      userDescription: String?,
                      vendor: String,
                      datePosted: Date?,
                      dateCreated: Date) {
            self.amount = amount
            self.userDescription = userDescription
            self.vendor = vendor
            self.datePosted = datePosted.map(Account.Transaction.sanitize(date:))
            self.dateCreated = Account.Transaction.sanitize(date: dateCreated)
        }


        var transactionType: TransactionType {
            if amount <= 0 {
                return .debit
            } else {
                return .credit
            }
        }

        var debitAmount: Double {
            return -amount
        }

        static func == (_ lhs: Transaction, _ rhs: Transaction) -> Bool {
            return (lhs.amount == rhs.amount &&
                lhs.dateCreated == rhs.dateCreated &&
                lhs.datePosted == rhs.datePosted &&
                lhs.vendor == rhs.vendor &&
                lhs.userDescription == rhs.userDescription)
        }
    }
}

extension Account : Hashable {
    var hashValue: Int {
        return id.hashValue
    }

    static func ==(lhs: Account, rhs: Account) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Account {
    convenience init?(jsonObject: [String:Any]) {
        return nil
    }

    var jsonObject: [String:Any] {
        return [:]
    }
}

extension Account.Transaction {
    init?(jsonObject: [String:Any]) {
        guard let amount = jsonObject[Account.Transaction.amountKey] as? Double,
            let dateCreatedDouble = jsonObject[Account.Transaction.dateCreatedKey] as? Double,
            let vendor = jsonObject[Account.Transaction.vendorKey] as? String
            else {
                return nil
        }

        let dateCreated = Date(timeIntervalSince1970: dateCreatedDouble)
        let userDescription = jsonObject[Account.Transaction.userDescriptionKey] as? String

        let datePostedString = jsonObject[Account.Transaction.datePostedKey] as? String
        let datePosted = datePostedString.flatMap(Account.Transaction.dateFormatter.date(from:))
        self.init(amount: amount,
                  userDescription: userDescription,
                  vendor: vendor,
                  datePosted: datePosted,
                  dateCreated: dateCreated)
    }

    var jsonObject: [String:Any] {
        var back: [String:Any] = [
            Account.Transaction.amountKey : amount,
            Account.Transaction.dateCreatedKey: dateCreated.timeIntervalSince1970,
            Account.Transaction.datePostedKey : datePosted.map(Account.Transaction.dateFormatter.string(from:)) as Any,
            Account.Transaction.vendorKey: vendor,
            ]

        if let desc = userDescription {
            back[Account.Transaction.userDescriptionKey] = desc
        }

        return back
    }

    internal static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ssZ"
        let timeZoneName = TimeZone.abbreviationDictionary["UTC"]!
        let timeZone = TimeZone(identifier: timeZoneName)
        formatter.timeZone = timeZone
        return formatter
    }()

    internal static var amountKey: String = "amount"
    internal static var dateCreatedKey: String = "date_created"
    internal static var datePostedKey: String = "date_posted"
    internal static var vendorKey: String = "vendor"
    internal static var userDescriptionKey: String = "user_description"
}
