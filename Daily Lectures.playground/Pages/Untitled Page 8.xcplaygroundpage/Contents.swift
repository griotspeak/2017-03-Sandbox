//: [Previous](@previous)

import Foundation

let dictionary: [String : Any] = [
    "name" : "Lindsey",
    "occupation" : "Campus Director",
    "power-level" : 9001,
    "students" : ["Ali", "Brent", "Crystal", "Tennant"]
]

let jsonRepresentation = try! JSONSerialization.data(withJSONObject: dictionary, options: [])


let jsonString = String(bytes: jsonRepresentation, encoding: .utf8)
print(jsonString)

//: [Next](@next)
