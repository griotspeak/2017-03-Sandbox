//: [Previous](@previous)

import Foundation

// because this is a CLI tool
var keepRunning = true

if let url = URL(string: "http://www.codingbat.com") {
    let session = URLSession.shared

    let task = session.dataTask(with: url) { (optionalData, optionalResponse, optionalError) in
        print(String(describing: optionalData))
        print(String(describing: optionalResponse))
        print(String(describing: optionalError))
        keepRunning = false
    }

    task.resume()
}

while keepRunning {
}

//: [Next](@next)
