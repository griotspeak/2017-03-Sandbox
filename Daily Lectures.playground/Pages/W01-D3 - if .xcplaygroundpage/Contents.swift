let isDay = false

if isDay {
    print("wait")
} else {
    print("party")
}

let age = 19

if age <= 21 {
    print("have a lemonade!")
} else {
    print("have a tasty alcoholic beverage")
}


let isFrench = false

if isFrench && age >= 16 {
    print("you can drink")
} else if isFrench == false && age >= 21 {
    print("you can drink")
} else {
    print("no drinks, friend")
}
