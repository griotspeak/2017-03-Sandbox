//: Strings

let emojiString = "🔥"

print("\ncharacters")
for character in emojiString.characters {
    print(character)
}

print("\nutf8")
for character in emojiString.utf8 {
    print(character)
}

print("\nutf16")
for character in emojiString.utf16 {
    print(character)
}
