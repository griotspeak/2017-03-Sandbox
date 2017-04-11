let listOfLists: [[Int]] = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

// flatMap using identity will flatten a list
let identity: ([Int]) -> [Int] = { $0 }
let flattened = listOfLists.flatMap(identity)


let toString: ([Int]) -> [String] = { innerList in
    innerList.map { number in
        number.description
    }
}
let mapResult = listOfLists.map(toString)
let strings = listOfLists.flatMap(toString)

// flattening is the act of taking two layers of 'container' and making it one.

// optional is a layer of container

let listOfOptionals: [Int?] = [
    1, 2, nil, 99, 100
]
let listOfOptionalsUsingArray: [[Int]] = [
    [1], [2], [], [99], [100]
]

let optionalIdentity: (Int?) -> Int? = { $0 }
let listDroppingNils: [Int] = listOfOptionals.flatMap(optionalIdentity)
let listDroppingEmpty: [Int] = listOfOptionalsUsingArray.flatMap(identity)





