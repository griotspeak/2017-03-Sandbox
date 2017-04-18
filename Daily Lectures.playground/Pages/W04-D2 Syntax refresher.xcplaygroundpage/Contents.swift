

// `let` is a keyword
// `let` is used to declare a constant
// `value` is the name of the constant
// this is a declaration and definition of the constant named `value`
// providing `1` makes this a definition (as well as a declaration)
let value = 1

// `declaredButUndefinedValue` is declared
// It has no definition yet.
let declaredButUndefinedValue: Int


// `func` is a keyword
// `func` is used to declare and define a function
// `addTwoNumbers` is the name of the function
// everything before the curly braces is the declaration
// the body of the method 'defines' the function's behavior
// `addTwoNumbers` accepts two parameters, `lhs` and `rhs
// `lhs` and `rhs` are, in effect, constants that live for the entire scope of `addTwoNumbers`
// the types of `lhs` and `rhs` are `Int` and `Int`
// The return type of `addTwoNumbers` is `Int`
// the body of `addTwoNumbers` is `return lhs + rhs`
func addTwoNumbers(lhs: Int, rhs: Int) -> Int {
    return lhs + rhs
}




// declaring a constant is intentionally similar to declaring a function argument
let myName: String
func greet(yourName: String) {

}


// constants and variables typically begin with a lower case letter
// Types begin with an upper case letter.




class Ticket : CustomStringConvertible {
    static var universalCount: Int = 0
    var number: Int


    init() {
        let myType = type(of: self)
        self.number = myType.universalCount
        myType.universalCount += 1
    }

    var description: String {
        return "Ticket #\(number)"
    }
}

// `foo`, `bar`, and `baz` hold instances of type `Ticket`
let foo = Ticket()
let bar = Ticket()
let baz = Ticket()


print("I have made \(Ticket.universalCount) tickets altogether")



