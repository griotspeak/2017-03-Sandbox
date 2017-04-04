
struct Location : CustomStringConvertible {
    var x: Int
    var y: Int

    var description: String {
        return "(x: \(x), y: \(y))"
    }
}

let myLocation = Location(x: 1, y: 43)

print(myLocation)