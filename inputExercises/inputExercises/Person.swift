//
//  Person.swift
//  inputExercises
//
//  Created by TJ Usiyan on 2017/04/18.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

class Person : CustomStringConvertible {
    let familyName: String
    let givenName: String
    var fullName: String {
        return "\(givenName) of \(familyName)"
    }

    init(givenName: String, familyName: String) {
        self.givenName = givenName
        self.familyName = familyName
    }

    var description: String {
        return fullName
    }

}
