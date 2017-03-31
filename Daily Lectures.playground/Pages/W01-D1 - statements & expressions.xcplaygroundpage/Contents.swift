//: Expressions can be reduced to a value ("evaluated")
1 // expression
1 + 1 // expression
3.5 * 2 // expression

//: Statements do not produce a 'useful' value
if false {

}

for _ in 0...5 {
}

func doNothing() {
}

func doNothingToo() -> Void {
}

doNothing()
doNothingToo()