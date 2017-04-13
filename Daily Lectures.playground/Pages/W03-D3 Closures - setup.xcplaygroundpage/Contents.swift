enum BinaryOperation {
    case add
    case subtract
    case custom((Int, Int) -> Int)

    func compute(_ lhs: Int, _ rhs: Int) -> Int {
        switch self {
        case .add:
            return lhs + rhs
        case .subtract:
            return lhs - rhs
        case .custom(let closure):
            return closure(lhs, rhs)
        }
    }
}

let addOperation = BinaryOperation.add

func multiply(_ lhs: Int, _ rhs: Int) -> Int {
    return lhs * rhs
}

let multiplyClosure = multiply(_:_:)
let multiplyOperation = BinaryOperation.custom(multiplyClosure)

addOperation.compute(4, 5)
multiplyOperation.compute(4, 5)

// Higher order functions - returning a closure

func repeater(phrase: String) -> (Int) -> String {
    return { (times: Int) -> String in
        var newString = ""
        for _ in 0..<times {
            newString.append(phrase)
        }

        return newString
    }
}

let asker: (Int) -> String = repeater(phrase: "Are we there yet?\n")
print(asker(10))
print("-")
print(asker(3))
