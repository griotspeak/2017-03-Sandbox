// structs cannot be subclassed.

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

class Student : Person {
    var grade: Int = 0
}

func printPersonInfo(_ person: Person) {
    print("This person's name is \(person.name) and their age is \(person.age)")
//     print("This person's grade is \(person.grade)") // We cannot refer to `grade` because `person` is not guaranteed to have one.
}

let sherlock = Person(name: "Sherlock", age: 40)
let watson = Student(name: "Watson", age: 25)
let moriarty = Person(name: "Moriarty", age: 3)

printPersonInfo(sherlock)
printPersonInfo(watson)
printPersonInfo(moriarty)
