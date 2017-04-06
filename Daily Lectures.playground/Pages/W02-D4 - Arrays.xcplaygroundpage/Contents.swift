//: Arrays
// Arrays are
//     - Ordered
//     - Typed


var shows = [
    "Family Matters",
    "Angela Anaconda",
    "Orphan Black",
    "This is Us",
    "Rick and Morty",
    "Samurai Champloo"
]

//: Subscripting
// the square bracket notation is referred to as subscripting or subscript

//: Accessing
print("shows.count: \(shows.count)")
print("shows.first: \(shows.first!)")
print("shows.last: \(shows.last!)")
print("shows[0]: \(shows[0])")
print("shows[1]: \(shows[1])")

//: Mutating
shows.append("House")
shows[0] = "Psych"
shows.insert("Family Matters", at: 1)
if let houseIndex = shows.index(of: "House") {
    shows.remove(at: houseIndex)
} else {
    print("We forgot House?")
}
shows += ["The Night Manager", "Chance"]

//: iterating

print("\n### The shows we've listed are:")
for show in shows {
    print(show)
}

// counting as we iterate

print("\n### The shows we've listed are (Once more, with style):")
for (counter, show) in shows.enumerated() {
    print("\(counter): \(show)")
}


// creating new arrays

let array1 = [1, 2, 3]
var mutableArray1 = array1
let array2 = [4, 5, 6]

mutableArray1 += array2
let array1And2 = array1 + array2

// drop first or last element
shows.dropFirst()
shows.dropLast()

