struct Location : Equatable {
    var x: Int
    var y: Int

    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

let left = Location(x: 0, y: 0)
let right = Location(x: 0, y: 0)
left == right
