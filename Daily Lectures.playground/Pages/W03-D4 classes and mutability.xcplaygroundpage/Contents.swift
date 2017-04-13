class Business : CustomStringConvertible {
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

let cookie = Business(name: "Nana's Cookie Barn", age: 50)
let club = cookie

// `let` for reference semantics means that we cannot change the reference
//sherlock = Person(name: "Ted", age: 532)

// We can mutate the instance that the reference points to
cookie.name = "Sharks"
print(cookie)
