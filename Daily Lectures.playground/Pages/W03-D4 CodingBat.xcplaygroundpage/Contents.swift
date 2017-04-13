import Foundation
func removeX(_ string: String) -> String {
    let filteredCharacters = string.characters.filter { ($0 != "x") && $0 != "X" }
    return String(filteredCharacters)
}

func noX(_ list: [String]) -> [String] {
    return list.map(removeX)
}


noX(["xxax", "xbxbx", "xxcx"])

let dictionary: [String: Set<Int>] = [
    "Parsely" : [1, 4, 6, 2, 6, 6],
    "Sage" : [7, 6, 9, 10],
    "Rosemary" : [2, 1, 2, 25],
    "Thyme" : [9, 15, 5,6 ,16],
]

func average(_ list: [Int]) -> Int {
    let sum = list.reduce(0, +)
    let average = Double(sum) / Double(list.count)
    let rounded = Int(floor(average))
    return rounded
}

func average(_ list: Set<Int>) -> Int {
    return average(Array(list))
}


let arrayFromDictionary: [(key: String, value: Set<Int>)] = Array(dictionary)
let individualAverages = dictionary.map { (name, numbers) -> (name: String, average: Int) in
    return (name, average(numbers))
}
let allNumbers = dictionary.flatMap { (_, numbers) in
    numbers
}
print(average(allNumbers))
print(individualAverages)
