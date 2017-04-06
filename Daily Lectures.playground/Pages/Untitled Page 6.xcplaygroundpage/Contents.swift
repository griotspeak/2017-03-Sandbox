//    0 | 1 | 2
//   -----------
//    3 | 4 | 5
//   -----------
//    6 | 7 | 8



enum Symbol {
    case x
    case o
}

struct Player {
    var name: String
    let symbol: Symbol
}

typealias Move = (location: Int, symbol: Symbol)


var tom = Player(name: "Tom", symbol: .x)
tom.name = "Tim"


func createPlayer(name: String, symbol: Symbol) -> Player? {
    if name.isEmpty {
        return nil
    } else {
        return Player(name: name, symbol: symbol)
    }
}

let spots: [Symbol?] = [
    nil, nil, nil,
    nil, nil, nil,
    nil, nil, nil,
]
