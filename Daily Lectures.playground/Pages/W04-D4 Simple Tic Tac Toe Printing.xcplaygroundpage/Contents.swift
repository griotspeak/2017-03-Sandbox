
struct Board : CustomStringConvertible {
    // There should only ever be 9 items in this array
    var spaces: [Space]

    enum Space : CustomStringConvertible {
        case x
        case o
        case empty

        var description: String {
            switch self {
            case .x:
                return "x"
            case .o:
                return "o"
            case .empty:
                return " "
            }
        }
    }

    subscript(col: Int, row: Int) -> Space {
        get {
            return spaces[(row * 3) + col]
        }
        set(newValue) {
            spaces[(row * 3) + col] = newValue
        }
    }

    var description: String {
        let horizontalLine = "-----"
        //              (0, 0)       (0, 1)       (0, 2)
        //              (1, 0)       (1, 1)       (1, 2)
        //              (2, 0)       (2, 1)       (2, 2)
        let lineOne = "\(spaces[0])|\(spaces[1])|\(spaces[2])"
        let lineTwo = "\(spaces[3])|\(spaces[4])|\(spaces[5])"
        let lnThree = "\(spaces[6])|\(spaces[7])|\(spaces[8])"
        return "\(lineOne)\n\(horizontalLine)\n\(lineTwo)\n\(horizontalLine)\n\(lnThree)"
    }
}

var board = Board(spaces: Array(repeating: .empty, count: 9))
board[1, 1] = .x
board[0, 0] = .o
board[2, 0] = .x
board[0, 2] = .o
print(board)
