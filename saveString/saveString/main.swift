//
//  main.swift
//  saveString
//
//  Created by TJ Usiyan on 2017/04/25.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import Foundation

let fileManager = FileManager.default
let fileURL = fileManager.homeDirectoryForCurrentUser.appendingPathComponent("Desktop/Foo.txt")

let filePath = fileURL.path
print("filePath: \(filePath)")

func save(text: String) -> Bool {
    if let _ = try? text.write(toFile: filePath, atomically: true, encoding: .utf8) {
        return true
    } else {
        return false
    }
}

func load() -> String? {


    return try? String(contentsOfFile: filePath, encoding: .utf8)
}

if save(text: "Boogie woogie oogie till you just can't boogie no more!") {
    print("saved successfully!")
} else {
    print("something went wrong while saving")
}


//if let string = load() {
//    print(string)
//} else {
//    print("we failed to load the string! ERROR!")
//}

