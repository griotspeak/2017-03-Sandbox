func myMin<T : Comparable>(_ lhs: T, _ rhs: T) -> T {
    if lhs < rhs {
        return lhs
    } else if lhs > rhs {
        return rhs
    } else {
        return lhs
    }
}

func replicate<T>(_ input: T) -> (T, T) {
    return (input, input)
}

[1, 2, 3].map { $0

}
