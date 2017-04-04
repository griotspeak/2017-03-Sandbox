let letters = ["a", "b", "c"]
let numbers = [1, 2, 3]

for tuple in zip(letters, numbers) {
    print(tuple)
}
print()

// shortest list determines length of zipped list
let moreLetters = ["a", "b", "c", "d", "e"]
for tuple in zip(moreLetters, numbers) {
    print(tuple)
}

