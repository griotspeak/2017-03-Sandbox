// Modify and return the given map as follows: if the key "a" has a value, set the key "b" to have that value, and set the key "a" to have the value "". Basically "b" is a bully, taking the value and replacing it with the empty string.

func mapBully(_ input: [String: String]) -> [String: String]{
    if let aValue = input["a"] {
        var back = input
        back["b"] = aValue
        back["a"] = ""
        return back
    } else {
        return input
    }
}

mapBully(["a": "candy", "b": "dirt"]) == ["a": "", "b": "candy"]
mapBully(["a": "candy"]) == ["a": "", "b": "candy"]
mapBully(["a": "candy", "b": "carrot", "c": "meh"]) == ["a": "", "b": "candy", "c": "meh"]


// The type of a dictionary using shorthand syntax
// [«key type»:«value type»]
// setting the value for a key in a dictionary
// «dict»[«key»] = «value»

// Given a map of food keys and topping values, modify and return the map as follows: if the key "ice cream" is present, set its value to "cherry". In all cases, set the key "bread" to have the value "butter".
func topping1(_ input: [String: String]) -> [String: String] {
    var back = input

    if let _ = back["ice cream"] {
        back["ice cream"] = "cherry"
    }

    back["bread"] = "butter"

    return back
}

topping1(["ice cream": "peanuts"]) == ["bread": "butter", "ice cream": "cherry"]
topping1([:]) == ["bread": "butter"]
topping1(["pancake": "syrup"]) == ["bread": "butter", "pancake": "syrup"]



//  Modify and return the given map as follows: if the keys "a" and "b" are both in the map and have equal values, remove them both.
func mapAB2(_ input: [String: String]) -> [String: String] {
    var back = input

    if let aValue = back["a"],
        let bValue = back["b"],
        aValue == bValue {

        back.removeValue(forKey: "a")
        back["b"] = nil
    }

    return back
}

mapAB2(["a": "aaa", "b": "aaa", "c": "cake"]) == ["c": "cake"]
mapAB2(["a": "aaa", "b": "bbb"]) == ["a": "aaa", "b": "bbb"]
mapAB2(["a": "aaa", "b": "bbb", "c": "aaa"]) == ["a": "aaa", "b": "bbb", "c": "aaa"]

// Modify and return the given map as follows: if the keys "a" and "b" have values that have different lengths, then set "c" to have the longer value. If the values exist and have the same length, change them both to the empty string in the map.
func mapAB4(_ input: [String: String]) -> [String: String] {
    var back = input

    if let aValue = back["a"],
        let bValue = back["b"] {
        let aLength = aValue.characters.count
        let bLength = bValue.characters.count

        if aLength < bLength {
            back["c"] = bValue
        } else  if aLength > bLength {
            back["c"] = aValue
        } else {
            back["a"] = ""
            back["b"] = ""
        }
    }

    return back
}

mapAB4(["a": "aaa", "b": "bb", "c": "cake"]) == ["a": "aaa", "b": "bb", "c": "aaa"]
mapAB4(["a": "aa", "b": "bbb", "c": "cake"]) == ["a": "aa", "b": "bbb", "c": "bbb"]
mapAB4(["a": "aa", "b": "bbb"]) == ["a": "aa", "b": "bbb", "c": "bbb"]



//Given an array of strings, return a Map<String, Integer> containing a key for every different string in the array, and the value is that string's length.

func wordLen(_ input: [String]) -> [String: Int] {
    var back: [String: Int] = [:]

    for string in input {
        back[string] = string.characters.count
    }

    return back
}

wordLen(["a", "bb", "a", "bb"]) == ["bb": 2, "a": 1]
wordLen(["this", "and", "that", "and"]) == ["that": 4, "and": 3, "this": 4]
wordLen(["code", "code", "code", "bug"]) == ["code": 4, "bug": 3]


//Given an array of strings, return a Map<Int, String> containing a key for every different length in the array, and the value is a set of the strings with the associated length

func wordLengthGroup(_ input: [String]) -> [Int: Set<String>] {
    var back: [Int: Set<String>] = [:]

    for string in input {
        let length = string.characters.count
        if var set = back[length]  {
            set.insert(string)
            back[length] = set
        } else {
            back[length] = [string]
        }
    }

    return back
}

let animalWords: [String] = ["Aerial", "Affect", "Agile", "Agriculture", "Animal", "Attract", "Audubon", "Backyard", "Barrier", "Beak", "Bill", "Birdbath", "Branch", "Breed", "Buzzard", "Cage", "Camouflage", "Capture", "Carrier", "Cheep", "Chick", "Claw", "Collusion", "Color", "Control", "Couple", "Creature", "Cruise", "Danger", "Diet", "Distance", "Domestic", "Drift", "Effect", "Eggs", "Endangered", "Environment", "Estuary", "Expert", "Eyesight", "Feather", "Feed", "Feeder", "Fish", "Fledgling", "Flight", "Float", "Flock", "Flutter", "Fly", "Formation", "Game", "Garden", "Habitat", "Hidden", "Hover", "Hunt", "Identification", "Injured", "Jess", "Keen", "Land", "Lay", "Limb", "Maintain", "Marsh", "Mate", "Migration", "Movement", "Names", "Nature", "Nest", "Notice", "Nuisance", "Observation", "Order", "Ornithology", "Peck", "Perch", "Pet", "Photograph", "Population", "Predator", "Professional", "Quantity", "Quest", "Quick", "Quiet", "Range", "Raptor", "Rodent", "Roost", "Seasonal", "Seeds", "Sentinel", "Shoot", "Shorebird", "Shorebird", "Sight", "Size", "Soar", "Song", "Songbird", "Speed", "Squirrel", "Streak", "Survive", "Tally", "Talon", "Tame", "Temperature", "Thermals", "Track", "Tree", "Types", "Universal", "Vegetables", "Vocal", "Vulture", "Wade", "Watch", "Water", "Waterfowl", "Weather", "Wetlands", "Wild", "Wildlife", "Wildlife", "Window", "Wing", "Wound", "Yonder", "Young", "Zone", "Zoo"]
let output = wordLengthGroup(animalWords)

print(output)

output.reduce(true) { (accum: Bool, keyValuePair: (key: Int, value: Set<String>)) in
    let (length, stringsOfLength) = keyValuePair
    return accum && (stringsOfLength.reduce(true) { (iAccum: Bool, singleString: String) in
        return singleString.characters.count == length
    })
}

