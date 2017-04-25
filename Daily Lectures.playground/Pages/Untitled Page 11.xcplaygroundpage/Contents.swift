//: [Previous](@previous)

import Foundation

func save(text: String) -> Bool {
    if let _ = try? text.write(toFile: "/Users/tj/Desktop/Foo.txt", atomically: true, encoding: .utf8) {
        return true
    } else {
        return false
    }
}

func load() -> String? {
    return try? String(contentsOfFile: "/Users/tj/Desktop/Foo.txt", encoding: .utf8)
}

save(text: "Boogie woogie oogie till you just can't boogie no more!")


//: [Next](@next)
