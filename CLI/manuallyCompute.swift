struct Pair {
    // instance property
    var left: Int {
        willSet {
            print("left is \(left) and will become \(newValue)")
        }
        didSet {
            print("left used to be \(oldValue) and is now \(left)")
        }
    }
    // instance property
    var right: Int {
        willSet(cats) {
            print("right is \(right) and will become \(cats)")
        }
        didSet(dogs) {
            print("right used to be \(dogs) and is now \(right)")
        }
    }

    init(left: Int, right: Int) {
        self.left = left
        self.right = right
        let myType = type(of: self)
        myType.customersServed += 1
    }

    // instance property
    var sum: Int {
        return left + right
    }

    // type property
    static var customersServed: Int = 0

}

print("Pair.customersServed: \(Pair.customersServed)")

var instanceOfPair = Pair(left: 1, right: 2)

print("instanceOfPair.left: \(instanceOfPair.left)")
print("instanceOfPair.right: \(instanceOfPair.right)")

print("instanceOfPair.sum: \(instanceOfPair.sum)")

print("Pair.customersServed: \(Pair.customersServed)")

instanceOfPair.right = 5
print("instanceOfPair.left: \(instanceOfPair.left)")
print("instanceOfPair.right: \(instanceOfPair.right)")

print("instanceOfPair.sum: \(instanceOfPair.sum)")
