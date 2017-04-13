func repeater(times: Int) -> (String) -> String {
    return { (phrase: String) -> String in
        var newString = ""
        for _ in 0..<times {
            newString.append(phrase)
        }

        return newString
    }
}

let asker = repeater(times: 3)
print(asker("my name is mud\n"))

let list = [
    "Hey! ",
    "Are we there yet?\n"
    ]
print(list.map(repeater(times: 3)))





