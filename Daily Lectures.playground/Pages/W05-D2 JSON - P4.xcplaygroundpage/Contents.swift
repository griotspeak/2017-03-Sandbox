//: [Previous](@previous)

import Foundation

let dictionary: [String : Any] = [
    "name" : "Lindsey",
    "occupation" : "Campus Director",
    "power-level" : 9001,
    "students" : ["Ali", "Brent", "Crystal", "Tennant"]
]

struct Person {
    let name: String
    let occupation: String
    let powerLevel: Int?
    let students: [String]

    init(name: String, occupation: String, powerLevel: Int?, students: [String]) {
        self.name = name
        self.occupation = occupation
        self.students = students
        self.powerLevel = powerLevel
    }

    init?(jsonDictionary: [String: Any]) {
        guard let name = jsonDictionary["name"] as? String,
            let students: [String] = jsonDictionary["students"] as? [String],
            let occupation = jsonDictionary["occupation"] as? String else {
                return nil
        }

        let powerLevel = jsonDictionary["power-level"] as? Int
        self.init(name: name, occupation: occupation, powerLevel: powerLevel, students: students)
    }
}

var person: Person?

if let myPerson = Person(jsonDictionary: dictionary) {
    person = myPerson
} else {
    person = nil
}
let dictionary2: [String : Any] = [
    "name" : "Lindsey",
    "occupation" : "Campus Director",
    "students" : ["Ali", "Brent", "Crystal", "Tennant"]
]
print(Person(jsonDictionary: dictionary2)!)

//: [Next](@next)
