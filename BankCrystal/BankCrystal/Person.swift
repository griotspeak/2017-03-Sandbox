//
//  Person.swift
//  BankCrystal
//
//  Created by TJ Usiyan on 2017/07/10.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

class Person {
    let givenName: String
    let familyName: String
    let email: String

    var fullName: String {
        let name = givenName + " " + familyName
        return name
    }

    init(givenName: String, familyName: String, email: String) {
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
    }
}

extension Person : Hashable {
    var hashValue: Int {
        return email.hashValue
    }

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.email == rhs.email
    }
}
