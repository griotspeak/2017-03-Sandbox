//: `init` and inheritance

// structs cannot be subclassed.



//: Method Dispatch
// When you send a message to a class
// 
// 1. Does this class have a concrete implementation of the method?
//          if yes: Use it.
//          if no: proceed
// 2. Does my super class have an implementation?
//          if yes: Use it.
//          if no: proceed
// 3. Does my super's super class have an implementation?
//          if yes: Use it.
//          if no: proceed
// 4. etc… until you reach base class. 
// 2. Does base class have an implementation?
//          if yes: Use it.
//          if no: crash or fail to compile

class Person : CustomStringConvertible {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    var description: String {
        return "(name: \(name), age: \(age))"
    }

    func sleep() {
        print("Slept a nice 8 hours. Maybe even 9")
    }
}

class Student : Person {
    var grade: Int

    init(name: String, age: Int, grade: Int) {
        self.grade = grade
        super.init(name: name, age: age)
    }

    override func sleep() {
        if grade < 101 {
            print("WHAT IS SLEEP?")
        } else {
            print("Slept a nice 5 hours. Maybe even 6")
        }
    }
}

let yourFriend = Person(name: "Jim", age: 19)
let you = Student(name: "Jamie Madrox", age: 32, grade: 89)
yourFriend.sleep()
you.sleep()
