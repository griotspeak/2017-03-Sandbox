
class RepeatOne : IteratorProtocol {
    typealias Element = Int
    func next() -> Int? {
        return 1
    }
}

var counter = 0

for number in IteratorSequence(RepeatOne()) {
    print(number)

    if counter < 10 {
        counter += 1
    } else {
        break
    }
}



class RepeatTwoThreeTimes : IteratorProtocol {
    var currentCount = 0
    func next() -> Int? {
        if currentCount >= 3 {
            return nil
        } else {
            currentCount += 1
            return 2
        }
    }
}

for number in IteratorSequence(RepeatTwoThreeTimes()) {
    print(number)
}