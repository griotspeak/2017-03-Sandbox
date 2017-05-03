//: [Previous](@previous)

import Foundation

// because this is a CLI tool
var keepRunning = true

let session = URLSession.shared

guard let url = URL(string: "https://tiy-todo-angular.herokuapp.com/get-books-by-user.json") else {
    fatalError("failed to create URL")
}
var request = URLRequest(url: url)

request.httpMethod = "POST"
request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

let payload = try! JSONSerialization.data(withJSONObject: ["username":"dev@tiy.com"], options: [])
request.httpBody = payload

let task = session.dataTask(with: request) { (optionalData, optionalResponse, optionalError) in


    guard let data = optionalData,
        let httpResponse = optionalResponse as? HTTPURLResponse,
        let objects = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [[String: Any]] else {
            print("optionalResponse: \(optionalResponse)")
            print("optionalError: \(optionalError)")
            keepRunning = false
            return
    }

    print("httpResponse.statusCode: \(httpResponse.statusCode)")

    print(objects)
    keepRunning = false
}

task.resume()

while keepRunning {
}

//: [Next](@next)
