import Foundation

struct Point {
    let x: Int
    let y: Int

    // This is what we get for free
//    init(x: Int, y: Int) {
//        self.x = x
//        self.y = y
//    }

    var distanceFromOrigin: Double {
        let aSquared = pow(Double(x), 2)
        let bSquared = pow(Double(y), 2)
        let cSquared = aSquared + bSquared
        let c = sqrt(cSquared)
        return c
    }
}

// Point(x:y:) is a memberwise initializer that we received 'for free'

struct Location {

    // because we have provided a default value for all members, we also receive a 'free' no-argument initializer
    var x: Int = 0
    var y: Int = 0

    // this is what we get for 'free'
//    init() {
//        self.x = 0
//        self.y = 0
//    }
}

let location = Location()
location.x
location.y
let locationToo = Location(x: 1, y: 2)
locationToo.x
locationToo.y

