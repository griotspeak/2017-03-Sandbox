//: [Previous](@previous)

enum PhoneNumberSavingError : Error {
    case invalidCharacters
    case incorrectLength(Int)
    case invalidAreaCode
    case invalidCountryCode
}

func isNotDigit(_ character: Character) -> Bool {
    return ("0"..."9" ~= character) == false
}

func savePhoneNumber(input: String) throws -> Void {
    // success: true

    // invalid characters: false
    // incorrect length: false
    // invalid area code: false
    // invalid country code: false

    if input.isEmpty {
        throw PhoneNumberSavingError.incorrectLength(input.characters.count)
    } else if input.characters.contains(where: isNotDigit(_:)) {
        throw PhoneNumberSavingError.invalidCharacters
    }

    print("saved!")
    return

}

print("######## simple do-catch\n")

do {
    try savePhoneNumber(input: "404-352-9913")
} catch {
    print(error)
}

print("---------------------\n")

print("######## less simple do-catch")
do {
    try savePhoneNumber(input: "404-352-9913")
} catch PhoneNumberSavingError.invalidCharacters {
    print("You've entered invalid characters")
} catch {
    print(error)
}
print("---------------------")


print("######## less simple do-catch with binding")
do {
    try savePhoneNumber(input: "")
} catch PhoneNumberSavingError.invalidCharacters {
    print("You've entered invalid characters")
} catch PhoneNumberSavingError.incorrectLength(let length) {
    print("character length of \(length) is incorrect")
} catch {
    print(error)
}

print("######## shorthand try? error handling")
if let _ = try? savePhoneNumber(input: "") {
    print("success")
} else {
    print("WE FAILED AND I DON'T CARE WHY!")
}

print("######## shorthand try! error handling")
try! savePhoneNumber(input: "8675309")


let int = Int("123")
print(int!)


//: [Next](@next)
