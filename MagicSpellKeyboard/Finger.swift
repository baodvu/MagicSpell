struct Finger: Equatable, Hashable {
    enum Side {
        case Left
        case Right
    }
    enum Name {
        case Pinky
        case Ring
        case Middle
        case Index
        case Thumb
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
