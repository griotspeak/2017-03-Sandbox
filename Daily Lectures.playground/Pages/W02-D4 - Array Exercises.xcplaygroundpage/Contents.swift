// maximum
// write a function named `maximum` that, given and array of `Int`, returns the greatest value contained. 
let list = [-1, -3, -4, 6, 67, 7, 234, 1, 2]

func maximum(_ input: [Int]) -> Int? {
    if let first = input.first {
        var back = first
        for number in input.dropFirst() {
            if number > back {
                back = number
            }
        }
        
        return back
    } else {
        return nil
    }
}

maximum(list) == list.max()