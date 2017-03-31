
//: types
4 // this is an Int
let four = 4 // this is an Int
// type annotation
let spelledOutFour: String = "Four"
let inferredString = "a"
let letterA: Character = "a"
let vowelStrings = ["a", "e", "i", "o", "u"]
let vowels: [Character] = ["a", "e", "i", "o", "u"]


// String
// Int
// Double
// Float
// Array
// Character
// Dictionary
// Bool
// ...

//: Statements and expression

// Statements
// Statements are not expected to yield a value

// if statements
// ifelse statements
// while statements
// for statements
// declarations
// ...

let food: String
let drink: String = "water"

// Expressions
// Expressions do yield a value
3
4 + 5
"hat"
[1, 2, 3]
"f"


//: Constants & Variables

// `let` keyword is used to declare constants.
// constants represent immutable values
let myFirstConstant = 1

let myAge: Int

myAge = 3

// myAge = 5 // invalid. We cannot assign a second time

//: Operators
// binary operators work on two argument

// `+`
// `-`
// `/`
// `*`
// `&&`
// `!=`
// `==`

// unary operators work on one argument
// `!` // "not"

//: Control flow

let myName = "John Jacob Jingleheimer Schmidt"

// if statement

if myName == "mud" {
    print("Hi. My name is Dum, but backward.")
}

// if-else statement

if myAge >= 16 {
    print("I'm going to drive myself to the store!")
} else {
    print("Will you please drive me to the store?")
}

// else-if statement

if myAge > 21 {
    print("I am old enough, regardless")
} else if myName == "Prince" {
    print("I am funky")
} else {
    print("Nothing to see here.")
}

//: for statement

// over ranges
for i in 0...10 {
    print(i)
}

// over collections
for letter in "Hello".characters { // `.characters` required because a String is not a collection (It's complicated.)
    print(letter)
}

//: while statement

var counter = 0
while counter < 10 {
    print("counter: \(counter)")
    counter = counter + 1
}

while counter < 10 {
    print("this will not execute")
}

//: repeat-while statement

repeat {
    print("uno!")
    print("dos")
    print("tres")
} while counter < 10


// switch statements
switch myAge {
case 0, 1:
    print("Goo goo. Ga Ga.")
case 2..<4:
    print("I can talk. Listen to me talk. I am talking. Hear me talk.")
case 5...18:
    print("I am still your responsibility.")
case 19...Int.max:
    print("On my own! I miss not having to pay bills.")
default:
    print("I… am negative years old?")
}

myName
switch myName {
case "John Jacob Jingleheimer Schmidt":
    print("His name is my name too!")
case let name where name.hasPrefix("John"):
    print("Hello John! Is that short for Jonathan?")
default:
    print("Hello stranger!")
}

// fallthrough
let isMale = false

switch (myAge, isMale) {
case (let age, true):
    print("This boy is \(age) years old")
case (let age, false) where age < 4:
    print("So little!")
    fallthrough
case (_, false):
    print("Society demands that we not talk about a girl's age.")
}

//: LATER
// if-let statements
// guard statements
// guard-let statements
// defer statements

// talk about unicode

//: Functions

// no arguments. no return value
func sayHi() {
    print("hi")
}
sayHi()

// one parameter. no return value
func greet(person: String) {
    print("Hello, \(person)")
}
greet(person: "Sally")

// one parameter and a return value
func createGreeting(person: String) -> String {
    return "Hola, \(person)"
}
createGreeting(person: "Victor")

// no parameter and a return value
func randomNumber() -> Int {
    return 42
}


