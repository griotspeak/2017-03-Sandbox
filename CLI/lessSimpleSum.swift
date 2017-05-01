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

func getIntFromUser(prompt: String?, failureMessage: String, predicate: (Int) -> Bool) -> Int {

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

let augend = getIntFromUser(prompt: "Please enter the first integer", failureMessage: "Please enter an integer", predicate: { _ in true })
let addend = getIntFromUser(prompt: "Please enter the first integer", failureMessage: "Please enter an integer", predicate: { _ in true })

print("\(augend) + \(addend) = \(augend + addend)")
