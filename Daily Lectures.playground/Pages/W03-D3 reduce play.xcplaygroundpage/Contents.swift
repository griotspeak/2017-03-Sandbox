// There is at least one item in the `input`
func maximum(_ input: [Int]) -> Int? {
    guard let first = input.first else {
        return nil
    }
    return input.reduce(first) { (accum, element) in
        if element > accum {
            return element
        } else {
            return accum
        }
    }
}

func minimum(_ input: [Int]) -> Int? {
    guard let first = input.first else {
        return nil
    }
    return input.reduce(first, { (accum, element) in
        if element < accum {
            return element
        } else {
            return accum
        }
    })
}


func extremum(_ input: [Int], comparator: (_ element: Int, _ accum: Int) -> Bool) -> Int? {
    guard let first = input.first else {
        return nil
    }
    return input.reduce(first) { (accum, element) in
        if comparator(element, accum) {
            return element
        } else {
            return accum
        }
    }
}

maximum([1, 4, 5,6 ,32, 6, 3])

extremum([1, 4, 5,6 ,32, 6, 3]) {
    $0 > $1
}
extremum([1, 4, 5,6 ,32, 6, 3]) {
    $0 < $1
}

let greaterThanOp: (Int, Int) -> Bool = (>)
extremum([1, 4, 5,6 ,32, 6, 3], comparator: greaterThanOp)
extremum([1, 4, 5,6 ,32, 6, 3], comparator: >)

func sum(_ input: [Int]) -> Int {
    return input.reduce(0, +)
}

sum([1, 2, 3, 4])




