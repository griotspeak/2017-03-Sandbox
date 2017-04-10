import Foundation

struct Point {
    var x: Int
    var y: Int

    // You can provide default values to parameters just like in functions
    init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }

    // you can also have arbitrary computation in init methods
    init(roundedMidpointBetween pointA: Point, and pointB: Point) {
        self.x = Int(floor((Double(pointA.x + pointB.x)) / 2.0)) // Int is likely a bad choice here.
        self.y = Int(floor((Double(pointA.y + pointB.y)) / 2.0)) // Int is likely a bad choice here.
    }
}
let left = Point(x: -6, y: -6)
let right = Point(x: 8, y: 8)
let midpoint = Point(roundedMidpointBetween: left, and: right)
midpoint.x
midpoint.y



// |               -1 0 1 2                 |
// |------------------+---------------------|
// |                                        |


