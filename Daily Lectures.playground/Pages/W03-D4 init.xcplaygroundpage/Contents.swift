
// classes don't get free memberwise initializers
// You can get a free no-argument initializer if you provide default values for all members added by the class
class Thing {
    var isAlive: Bool = true
}
Thing()





class Plant {
    var isAlive: Bool
    init(isAlive: Bool = true) {
        self.isAlive = isAlive
    }
}

let somePlant = Plant(isAlive: false)


class DiscoveredPlant : Plant {
    var name: String

    init(name: String, isAlive: Bool = true) {
        self.name = name
        super.init(isAlive: isAlive)
    }
}

let mapleTree = DiscoveredPlant(name: "My Maple Tree", isAlive: true)
let pineTree = DiscoveredPlant(name: "My Dead Pine Tree", isAlive: false)

