class Plant {}
class Flower: Plant {}
class Tree: Plant {}
class DeciduousTree: Tree {}
class ConiferousTree: Tree {}

class Instrument {}
class Brass : Instrument {}
class Woodwind : Instrument {}
class Percussion : Instrument {
    var kind: PercussionKind = .idiophone
}
enum PercussionKind {
    case membranophone
    case idiophone
    case chordophone
}

