import Foundation

struct Point {
    var x: Int
    var y: Int

    // Writing *an* initializer forfeits 'free' initializers for structs
    init() {
        self.x = 0
        self.y = 0
    }

    var distanceFromOrigin: Double {
        let aSquared = pow(Double(x), 2)
        let bSquared = pow(Double(y), 2)
        let cSquared = aSquared + bSquared
        let c = sqrt(cSquared)
        return c
    }
}
