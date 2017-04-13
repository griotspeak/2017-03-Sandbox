// fancy initializers


struct Rectangle {
    typealias Point = (x: Double, y: Double)
typealias Size = (width: Double, height: Double)

    let origin: Point
    let size: Size

    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    init(x: Double, y: Double, width: Double, height: Double) {
        self.init(origin: (x, y), size: (width, height))
    }

    init(squareSideLength: Double, origin: Point) {
        self.origin = origin
        self.size = (width: squareSideLength, height: squareSideLength)
    }
}

let firstRectangle = Rectangle(x: 8, y: 9, width: 1, height: 4)
firstRectangle.origin
firstRectangle.size
let firstSquare = Rectangle(squareSideLength: 6, origin: (0, 0))
firstSquare.origin
firstSquare.size
