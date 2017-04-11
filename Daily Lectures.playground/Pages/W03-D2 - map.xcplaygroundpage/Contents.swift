// turn a collection of T into a collection of U with the same number of items.

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

var imperativeTitleCounts: [Int] = []
// This for loop's entire purpose is to 'transform' the titles array (`[String]`) into an array of counts (`[Int]`) with a one to one matching of elements.
for title in titles {
imperativeTitleCounts.append(title.characters.count)
}
imperativeTitleCounts


func getStringCharacterCount(_ input: String) -> Int {
    return input.characters.count
}

var functionalTitleCounts: [Int] = titles.map({
    input in
    input.characters.count
})

// for each item in `title`, call `getStringCharacterCount` and make a new array containing all of the results
titles.map(getStringCharacterCount)

// in general, all work that you do in the closure should be toward generating the output of the closure


enum ScoringEvent {
    case touchdown
    case fieldGoal
    case extraPoint
    case twoPointConversion
    case safety

    var pointValue: Int {
        switch self {
        case .touchdown:
            return 6
        case .extraPoint:
            return 1
        case .safety, .twoPointConversion:
            return 2
        case .fieldGoal:
            return 3
        }
    }
}

let events: [ScoringEvent] = [.touchdown, .fieldGoal, .twoPointConversion]
events.map({ $0.pointValue })
events.map({ input in
    input.pointValue
})






