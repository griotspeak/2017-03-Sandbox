func evaluate(_ moveSet: Set<Int>) -> Bool {

    let winningCombos: Set<Set<Int>> = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    return winningCombos.contains { winner in
        moveSet.isSuperset(of: winner)
    }
}
enum Symbol {
    case x, o
}

func splitMoves(_ allMoves: [Int: Symbol]) -> (x: Set<Int>, o: Set<Int>) {
    let seed: (x: Set<Int>, o: Set<Int>) = ([], [])

    return allMoves.reduce(seed) { (accum, element) in
        let (location, symbol) = element
        switch symbol {
        case .x:
            let newX = accum.x.union([location])
            return (newX, accum.o)
        case .o:
            let newO = accum.o.union([location])
            return (accum.x, newO)
        }
    }
}

func winner(moves: [Int: Symbol]) -> Symbol? {
    let (xMoves, oMoves) = splitMoves(moves)
    if evaluate(xMoves) {
        return .x
    } else if evaluate(oMoves) {
        return .o
    } else {
        return nil
    }
}

var moves: [Int: Symbol] = [
    0 : .o,
    1 : .x,
    2 : .o,
    3 : .x,
    5 : .x,
    6 : .o,
    8 : .x
]

winner(moves: moves)
moves[4] = .o
winner(moves: moves)

