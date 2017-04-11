
// reduce creates a new item of type U incrementally by building from a seed value (type U) while iterating a list of type T

let points = [1, 2, 3]

let addTwoNumbers: (Int, Int) -> Int = { (lhs, rhs) in
    lhs + rhs
}
let pointSum = points.reduce(0) { (accumulator, element) in
    return accumulator + element
}


let names = [
    "Brent",
    "Tina",
    "Tennant",
    "Alex"
]

let string = names.reduce("") { (accumulator, element) in
    print("accumulator: '\(accumulator)'")
    print("element: \(element)")
    var newString = accumulator
    newString.append(element)
    return newString
}
print(string)









let titles: [String] = [
    "Parable of the Sower",
    "The Perks of Being a Wallflower",
    "Game of Thrones",
    "Binti",
    "Riddlemaster of Hed",
    "Contact",
    "The Prince",
    "The BFG",
    "The Rise and Fall of the Roman Empire",
    "The Hitchhiker's Guide to the Galaxy"
]



