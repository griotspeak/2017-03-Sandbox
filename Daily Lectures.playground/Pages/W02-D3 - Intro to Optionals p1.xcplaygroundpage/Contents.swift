let numbers = [1, 3, 5, 7, 9]

func firstEvenNumber(in list: [Int]) -> Int? {
    for i in list {
        if i % 2 == 0 {
            return i
        }
    }

    return nil
}

firstEvenNumber(in: numbers)