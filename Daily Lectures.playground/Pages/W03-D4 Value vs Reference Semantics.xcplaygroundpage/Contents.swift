// different kinds of types that we know of
// classes
// structs
// enums


// Value semantics
struct Human : CustomStringConvertible {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    var description: String {
        return "(name: \(name), age: \(age))"
    }
}

// Reference semantics
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
}


var human1 = Human(name: "Bob", age: 8)
var human2 = human1 // Value semantics means that this makes a separate instance with equal member values
human2.age = 9
// what is human1's age?
human1.age

var person1 = Person(name: "Bob", age: 8)
var person2 = person1  // Reference semantics means that this makes a reference to the same instance
person2.age = 9
// what is person1's age?
person1.age

person2.name = "Ezekiel"
person1.name

human2.name = "Ezekiel"
human1.name


