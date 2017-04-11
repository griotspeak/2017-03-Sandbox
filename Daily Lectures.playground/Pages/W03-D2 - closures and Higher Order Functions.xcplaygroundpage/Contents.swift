// Higher order functions either accept a closure or return a closure

func createAddingFunction(value: Int) -> ((Int) -> Int) {
    return { secondInput in
        return secondInput + value
    }
}

let addThree = createAddingFunction(value: 3)
addThree(5)


func addThree(input: Int) -> Int {
    return input + 3
}

func addTen(input: Int) -> Int {
    return input + 10
}

addThree(input: 4)


func applyTwice(closure: (Int) -> Int, to input: Int) -> Int {
    let firstOutput = closure(input) // input + 3
    let secondOutput = closure(firstOutput) // input + 3
    return secondOutput
}

applyTwice(closure: addThree(input:), to: 0)
applyTwice(closure: addTen(input:), to: 0)
