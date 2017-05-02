//
//  main.swift
//  inputExercises
//
//  Created by TJ Usiyan on 2017/04/18.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation


print("Hello stranger!")
let hasNonWhitespaceCharacters: (String) -> Bool = { input in

    let whitespaceCharacters = CharacterSet.whitespacesAndNewlines

    let filtered = input.unicodeScalars.filter { char in
        whitespaceCharacters.contains(char) == false
    }

    return filtered.isEmpty == false
}



let givenName = getStringFromUser(prompt: "What is your given name?",
                                  failureMessage: "Please enter your given name.",
                                  predicate: hasNonWhitespaceCharacters)

print("Oh! Hello \(givenName), it is a pleasure!")

let familyName = getStringFromUser(prompt: "What, perchance, is your family name?",
                                   failureMessage: "Please enter your family name.",
                                   predicate: hasNonWhitespaceCharacters)

let person = Person(givenName: givenName, familyName: familyName)

print(person)


func scene1() {
    print("This is a description of the scene. I set the stage")

    let chosen = getChoiceFromUser(prompt: "Make your decision", choices: ["Red", "Blue"])

    switch chosen {
    case "Red":
        scene2()
    case "Blue":
        scene3()

    }
}
