var planeteers: [String: String] = [
    "Kwame" : "Earth",
    "Wheeler" : "Fire",
    "Linka" : "Wind",
    "Gi" : "Water",
]

// Dictionary is an unordered collection of key value pairs.
// keys must be Hashable
// there is no restriction on values

let kwamesElement: String? = planeteers["Kwame"]

// We access the value assocatied with a key using subscript notation
// We subscript in using the key
let jimsElement = planeteers["Jim"]

var favorites: [String: Int] = [
    "TJ" : 11,
    "Tennant" : 7,
    "Tina" : 7,
    "Alex" : 17,
    "Brent" : 9
]

// The typical method to add or update a key value pair is using subscript notation
planeteers["Ma-Ti"] = "Heart"

favorites.removeValue(forKey: "TJ")
favorites
let old: Int? = favorites.updateValue(49, forKey: "Tennant")
favorites
let newOld = favorites.updateValue(42, forKey: "TJ")
favorites

// iteration is done over keys and values at the same time.
for (key, value) in planeteers {
    print(key, value)
}




