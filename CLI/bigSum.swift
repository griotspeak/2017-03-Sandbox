func getStringFromUser(prompt optionalPrompt: String?, failureMessage: String, allowEmptyString: Bool = false) -> String {

    let emptyCheck: (String) -> Bool = { input in
        allowEmptyString || (input.isEmpty == false)
    }
    return getStringFromUser(prompt: optionalPrompt,
                             failureMessage: failureMessage,
                             predicate: emptyCheck)
}

func getStringFromUser(prompt optionalPrompt: String?, failureMessage: String, predicate: (String) -> Bool) -> String {
    var optionalValue: String? = nil

    while optionalValue == nil {
        if let prompt = optionalPrompt {
            print(prompt)
        }

        optionalValue = readLine(strippingNewline: true)

        if let value = optionalValue {
            if predicate(value) {
                return value
            } else {
                print(failureMessage)
                optionalValue = nil
            }
        }
    }

    fatalError("Unpossible.")
}


func getIntFromUser(prompt: String?, failureMessage: String, predicate: (Int) -> Bool = { _ in true }) -> Int {

    var integer: Int? = nil

    while integer == nil {
        if let thePrompt = prompt {
            print(thePrompt)
        }
        integer = Int(getStringFromUser(prompt: nil, failureMessage: failureMessage))

        if let unwrapped = integer,
            predicate(unwrapped) {
            return unwrapped
        } else {
            print(failureMessage)
            integer = nil
        }
    }

    fatalError("Unpossible.")
}



func getChoiceFromUser(prompt: String, choices: [String]) -> String {
    guard choices.isEmpty == false else {
        fatalError("choices must not be empty")
    }

    let count = choices.count
    guard count > 1 else {
        return choices.first!
    }

    var index = 1
    var newPrompt = prompt
    for choice in choices {
        newPrompt.append("    Enter \(index) for \(choice)\n")
        index += 1
    }

    print(newPrompt)
    let selectedIndex: Int = getIntFromUser(prompt: nil,
                                            failureMessage: newPrompt,
                                            predicate: { input in
                                                (input >= 1) && (input <= count)
    })
    
    return choices[selectedIndex - 1]
    
}

var list: [Int] = []
var shouldContinue: Bool

repeat {
    list.append(getIntFromUser(prompt: "Enter a number:", failureMessage: "Please enter an integer"))

    print("You've entered \(list.map { $0.description }.joined(separator: ", ")):")

    let noString = "No"
    let yesString = "Yes"
    let userChoiceAsString = getChoiceFromUser(prompt: "Would you like to add another number?\n", choices: [noString, yesString])
    shouldContinue = userChoiceAsString == yesString ? true : false
} while (shouldContinue)

print("\(list.map { $0.description }.joined(separator: " + ")) = \(list.reduce(0, +))")

