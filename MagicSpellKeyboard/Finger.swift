struct Finger: Equatable, Hashable {
    enum Side {
        case left
        case right
    }
    enum Name {
        case pinky
        case ring
        case middle
        case index
        case thumb
    }
    let side: Side
    let name: Name

    var hashValue: Int {
        return side.hashValue ^ name.hashValue
    }
}

// MARK: Equatable

func ==(lhs: Finger, rhs: Finger) -> Bool {
    return lhs.side == rhs.side && lhs.name == rhs.name
}
