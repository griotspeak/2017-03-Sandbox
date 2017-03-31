
func largestPowerOf2LessThanOrEqualTo(input: Int) -> Int {
    var answer = 2
    var shouldStop: Bool = false

    while shouldStop == false  {

        let possible = answer * 2

        if possible <= input {
            answer = possible
            shouldStop = false
        } else {
            shouldStop = true
        }
    }

    return answer
}

func _largestPowerOf2LessThanOrEqualTo(input: Int) -> Int {

    func _go(accumulator: Int, upperBound: Int) -> Int {
        let possible = accumulator * 2
        if possible > upperBound {
            return accumulator
        } else {
            return _go(accumulator: possible, upperBound: upperBound)
        }
    }


    return _go(accumulator: 1, upperBound: input)
}


let k = _largestPowerOf2LessThanOrEqualTo(input: 41)
print("biggest power of 2: \(k)")









// return the maximum multiple of 3 less than or equal to a given number




















