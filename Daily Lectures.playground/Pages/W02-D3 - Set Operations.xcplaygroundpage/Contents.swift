let a: Set<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let b: Set<Int> = [6, 7, 8]
let c: Set<Int> = [4, 5, 6]
let even: Set<Int> = [2, 4, 6, 8, 10]
let odd: Set<Int> = [1, 3, 5, 7, 9]


func describeOperations(on first: Set<Int>, and second: Set<Int>) {
    print("### Comparing \(first) & \(second) ###")

    print("first.isSubset(of: second): \(first.isSubset(of: second))")
    print("first.isDisjoint(with: second): \(first.isDisjoint(with: second))")

    print("union: \(first.union(second))")
    print("intersection: \(first.intersection(second))")
    print("symmetricDifference: \(first.symmetricDifference(second))")
    print("first - second: \(first.subtracting(second))")
    print("second - first: \(second.subtracting(first))")


    print("---\n\n")
}



describeOperations(on: a, and: a)
describeOperations(on: a, and: b)
describeOperations(on: b, and: c)
describeOperations(on: a, and: c)
describeOperations(on: c, and: a)
describeOperations(on: a, and: even)
describeOperations(on: even, and: odd)
