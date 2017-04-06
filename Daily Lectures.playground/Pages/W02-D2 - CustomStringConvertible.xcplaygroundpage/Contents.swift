
let list: [(Character, Int)] = [
    ("A", 1),
    ("B", 2),
    ("C", 3)
]

for (letter, number) in list {
    if number % 2 == 0 {
        print("nice round number \(number)")
    }
}

