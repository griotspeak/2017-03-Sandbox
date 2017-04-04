enum Piece {
    //
    case knight


    // a rook can move an arbitrary number of spaces on one axis (horizontal or vertical but not diagonally).
    case rook
}

typealias Location = (x: Int, y: Int)


// write a function accepting a location where neither x nor y are greater than 7 and a piece that returns a list of the possible valid moves. A move is only valid if the location's x and y are both in the range 0...7

func listPossibleEndLocations(piece: Piece, startLocation: Location) -> [Location] {
    return [
        (startLocation.x + 2, startLocation.y + 1),
        (startLocation.x + 2, startLocation.y - 1),
        (startLocation.x - 2, startLocation.y + 1),
        (startLocation.x - 2, startLocation.y - 1),
        (startLocation.x + 1, startLocation.y + 2),
        (startLocation.x + 1, startLocation.y - 2),
        (startLocation.x - 1, startLocation.y + 2),
        (startLocation.x - 1, startLocation.y - 2),
    ]
}

let answer = listPossibleEndLocations(piece: .knight, startLocation: (0, 0))
print(answer)
