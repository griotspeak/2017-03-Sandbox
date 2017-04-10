import Foundation

struct Point {

    // x and y are stored properties.
    // Stored properties can only be declared in the types declaraion (they cannot be added in an extension)
    let x: Int
    let y: Int

    // distanceFromOrigin is a computed property
    var distanceFromOrigin: Double {
        let aSquared = pow(Double(x), 2)
        let bSquared = pow(Double(y), 2)
        let cSquared = aSquared + bSquared
        let c = sqrt(cSquared)
        return c
    }
}

let position = Point(x: 3, y: 4)
position.distanceFromOrigin

