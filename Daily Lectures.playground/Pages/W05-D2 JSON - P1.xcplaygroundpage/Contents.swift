//: [Previous](@previous)

import Foundation

let dictionary: [String : Any] = [
    "name" : "Lindsey",
    "occupation" : "Campus Director",
    "power-level" : 9001,
    "students" : ["Ali", "Brent", "Crystal", "Tennant"]
]

func greeting(_ name: String) -> String {
    return "Hello \(name)!"
}

if let name = dictionary["name"] as? String {
    print(greeting(name))
} else {
    print("the value for name was not of type `String`")
}



//: [Next](@next)
