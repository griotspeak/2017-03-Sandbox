let numberFour = Int("4")
let numberPizza = Int("pizza")


if numberFour != nil {
    let unwrapped = numberFour!
    // use an exclamation mark to force unwrap an optional value
    // When the value is not nil, you will create a non-optional value
    // when the value is nil, YOU WILL CRASH
    print("thank you for providing the number \(unwrapped)")
}

if let unwrapped = numberFour {
    print("thank you for providing the number \(unwrapped)")
}

if let unwrapped = numberPizza {
    print("thank you for providing the number \(unwrapped)")
} else {
    print("Please provide valid input.")
}

enum Symbol {
    case x
    case o
}
