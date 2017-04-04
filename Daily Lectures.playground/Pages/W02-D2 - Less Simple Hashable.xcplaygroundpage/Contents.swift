func hashCombine(list: [Int]) -> Int {
    var back: Int = 0

    for i in list {
        back = hashCombine(back, i)
    }

    return back
}

func hashCombine(_ lhs: Int, _ rhs: Int) -> Int {
    let magicUInt64: UInt64 = 0x9e3779b97f4a7c15
    let _magicHashValue = Int(truncatingBitPattern: magicUInt64)
    return lhs ^ (rhs &+ _magicHashValue &+ (lhs << 6) &+ (lhs >> 2))
}

struct Location: Hashable {
    var x: Int
    var y: Int

    var hashValue: Int {
        let components = [
            x.hashValue,
            y.hashValue
        ]
        return hashCombine(list: components)
    }

    public static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

let locations: Set<Location> = [
    Location(x: 0, y: 0),
    Location(x: 2, y: 0),
    Location(x: 0, y: 1),
    Location(x: 0, y: 1)
]

