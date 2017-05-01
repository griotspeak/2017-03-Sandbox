//: [Previous](@previous)

import Foundation

let string = "{\"name\":\"Lindsey\",\"power-level\":9001,\"occupation\":\"Campus Director\",\"students\":[\"Ali\",\"Brent\",\"Crystal\",\"Tennant\"]}"
if let jsonData = string.data(using: .utf8),
    let jsonObjectAny = try? JSONSerialization.jsonObject(with: jsonData, options: []),
    let jsonObject = jsonObjectAny as? [String:Any] {
    print(jsonObject)
}

//: [Next](@next)
