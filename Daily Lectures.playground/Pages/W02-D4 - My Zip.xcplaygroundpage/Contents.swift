let letters: [Character] = ["a", "b", "c"]
let numbers = [1, 2, 3, 4, 5]

func myZip(_ lhs: [Character], _ rhs: [Int]) -> [(Character, Int)] {
    let length = min(lhs.count, rhs.count)

    var back: [(Character, Int)] = []

    for i in 0..<length {
        let newItem = (lhs[i], rhs[i])
        back.append(newItem)
    }

    return back
}

myZip(letters, numbers)