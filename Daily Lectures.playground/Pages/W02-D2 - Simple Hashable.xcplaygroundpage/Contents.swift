struct Location: Hashable {
    var x: Int
    var y: Int

    var hashValue: Int {
        return x.hashValue &+ y.hashValue
    }

    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

let locations: Set<Location> = [
    Location(x: 0, y: 0),
    Location(x: 2, y: 0),
    Location(x: 0, y: 1),
    Location(x: 0, y: 1)
]
