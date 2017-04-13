

func evens(_ input: [Int]) -> [Int] {
    return input.filter { item in
        return item % 2 == 0
    }
}

evens([1, 2, 3, 4, 5, 6, 7, 8, 9])

func sumIsMultipleOfThree(_ input: [(Int, Int, Int)]) -> [(Int, Int, Int)] {
    return input.filter { item in
        let (left, center, right) = item
        return (left + center + right) % 3 == 0
    }
}

let triples: [(Int, Int, Int)] = [
    (1, 2, 3), // included
    (0, 3, 1), // not included
    (4, 5, 6), // included
    (3, 3, 3), // included
    (3, 3, 4), // not included
    (5, 3, 3), // not included
]

print(sumIsMultipleOfThree(triples))



//findStudent(students, .maximum)
//findStudent(students, .minimum)


let students: [String: Set<String>] = [
    "Susan" : [
        "Porcupine",
        "Armadillo",
        "Opossum",
        "Goat",
    ],
    "Suzanne" : [
        "Zebra",
        "Porcupine",
    ],
    "Susie" : [],
    "Siouxsie" : [
        "Zebra",
        "Porcupine",
        "Elephant",
        "Rabbit",
        "Falcon",
    ],
    "John" : [
        "Goat",
        "Elephant",
        "Rabbit",
        "Squid",
    ],
    "Jon" : [
        "Horse",
        "Hippopotamus",
        "Butterfly"
    ],
    "Jonah" : ["Whale",
               "Lion",
               "Zebra",
               "Dog",
               "Zebra",
               "Porcupine",
               "Armadillo",
               "Opossum",
               "Goat",
               "Elephant",
               "Rabbit",
               "Squid",
               "Falcon",
               "Octopus",],
    "Jonathan" : [
        "Snail",
        "Cobra"
    ],
    "Jonas" : [
        "Cheetah",
        "Tiger"
    ],
]


let maxTuple = students.reduce(students.first!) { (accum, element) in
    if element.value.count > accum.value.count {
        return element
    } else {
        return accum
    }
}

let maxTuple2 = students.max { (lhs, rhs) in
    lhs.value.count < rhs.value.count
}

let highestCount = maxTuple.value.count

let filtered = students.filter { (_, value) in
    return value.count == highestCount
}

print("filtered: \(filtered)")

let mapped = filtered.map { (name, _) in
    return name
}
print("mapped: \(mapped)")
let justNames = Set(mapped)
