//: [Previous](@previous)


//: `assert`
// `assert` is only checked in debug builds
assert(true)
assert(true, "Say you'll always be true")

//: `assertionFailure`
// `assertionFailure` is similar to `assert` but it gives a hint to the compiler/optimizer that execution should end. This helps the compiler give you warnings about code written after it that will never execute
//assertionFailure()
//assertionFailure("We can't go on after this!")

var x = 3
if x < 19 {
    print("whew")
} else {
    assertionFailure("Why!")
    print("We can never reach this line and the compiler knows that.")
}

//: `precondition` demand that a condition is always met before continuing
// this is checked in both debug and release builds. Always!

precondition(true)
precondition(true, "and forever!")


//: `preconditionFailure` is to `precondition` as `assertionFailure` is to `assert`


//CheatSheet
//
//                      debug		release
//assert()				YES			NO
//assertionFailure()	YES			NO
//precondition()		YES			YES
//preconditionFailure()	YES			YES
//fatalError()			YES			YES

//: [Next](@next)
