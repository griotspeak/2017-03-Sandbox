func doubling(_ input: [Int]) -> [Int] {
    return input.map({ (element) -> Int in
        return element * 2
    })
}

doubling([1, 2, 3])


func rightDigit(_ input: [Int]) -> [Int] {
    return input.map { (element) in
        return element % 10
    }
}

rightDigit([14, 1242, 21, 4423, 51])

func moreY(_ input: [String]) -> [String] {
    return input.map { item in
        return "Y" + item + "Y"
    }
}

func moreYChar(_ input: [String]) -> [String] {
    return input.map { item in
        var newItemChars = "y".characters
        newItemChars.append(contentsOf: item.characters)
        newItemChars.append("y")
        return String(newItemChars)
    }
}

func moreYChar2(_ input: [String]) -> [String] {
    return input.map { item in
        var newItemChars = item.characters
        newItemChars.insert("y", at: newItemChars.startIndex)
        newItemChars.append("y")
        return String(newItemChars)
    }
}

moreY(["hello", "there"])
moreYChar(["hello", "there"])
moreYChar2(["hello", "there"])


func math1(_ input: [Int]) -> [Int] {
    return input.map({ element -> Int in
        return (element + 1) * 10
    })
}

func square(_ input: [Int]) -> [Int] {
    return input.map({ element -> Int in
        return element * element
    })
}

square([1, 2, 3, 4])





let listOfTuples = [
    (1, 2),
    (3, 6),
    (9, 3),
    (7, 2),
    (0, 1),
    (4, 8),
]

func product(_ input: [(Int, Int)]) -> [Int] {
    return input.map { (lhs, rhs) in
        return lhs * rhs
    }
}

func productRedux(_ input: [(Int, Int)]) -> [Int] {
    return input.map { (item) in
        let (lhs, rhs) = item
        return lhs * rhs
    }
}
product(listOfTuples) // [2, 18, 27, 14, 0, 32]
