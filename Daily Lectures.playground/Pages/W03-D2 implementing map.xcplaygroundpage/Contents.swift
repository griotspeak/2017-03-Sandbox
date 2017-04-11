func myIntMap(_ list: [Int], _ transform: (Int) -> Int) -> [Int] {
    var newList: [Int] = []

    for item in list {
        let newItem = transform(item)
        newList.append(newItem)
    }

    return newList
}


let numbers = [1, 2, 3, 4, 5, 6,7 ,8, 9]
myIntMap(numbers, {
    $0 * 2
})


// the idea of map is not restricted to same types

func myStringToIntMap(_ list: [String], _ transform: (String) -> Int) -> [Int] {
    var newList: [Int] = []

    for item in list {
        let newItem = transform(item)
        newList.append(newItem)
    }

    return newList
}

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

myStringToIntMap(titles, {
    $0.characters.count
})

let vowels: Set<Character> = ["a", "e", "i", "o", "u"]
let vowelCounts = myStringToIntMap(titles, { title in
    let withoutConsonants = title.characters.filter({
        char in vowels.contains(char)
    })
    return withoutConsonants.count

})

vowelCounts

