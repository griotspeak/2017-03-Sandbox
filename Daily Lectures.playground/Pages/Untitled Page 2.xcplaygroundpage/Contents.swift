for number in 1...10 {
    if number % 2 == 1 {
        if number % 3 == 0 {
            print(number)
        }
    }
}

for number in 1...10 {
    if number % 2 == 1 && number % 3 == 0 {
            print(number)
    }
}

for number in 1...10 where
    number % 2 == 1 && number % 3 == 0 {
        print(number)
}

let charactersInWord = Set("word".characters)
let charactersInNoodle = Set("noodle".characters)
charactersInNoodle.contains("z")

let letter = "d"
switch letter {
case "a", "b", "c":
    print("it's as easy as 1-2-3")
default:
    print("it's less simple than do-re-mi")
}


