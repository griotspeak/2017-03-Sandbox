// creates a new collection with elements that satisfy a provided predicate.

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


var imperativeList: [String] = []
for title in titles where title.hasPrefix("The") {
    imperativeList.append(title)
}
imperativeList

let functionalList = titles.filter({
    $0.hasPrefix("The")
})
imperativeList == functionalList


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

let events: [ScoringEvent] = [.touchdown, .fieldGoal, .twoPointConversion, .safety, .safety, .touchdown, .extraPoint]
let nonTouchdownEvents = events.filter {
    (input: ScoringEvent) -> Bool in
    return input != .touchdown
}

nonTouchdownEvents


