class LetterMapping {

    fileprivate static let lowerCaseMap: [Set<Finger>: String] = [
        [Finger(side: .left, name: .pinky)] : "a",
        [Finger(side: .left, name: .ring)] : "b",
        [Finger(side: .left, name: .middle)] : "c",
        [Finger(side: .left, name: .index)] : "d",
        [Finger(side: .left, name: .thumb)] : "e",
        [Finger(side: .right, name: .thumb)] : "f",
        [Finger(side: .right, name: .index)] : "g",
        [Finger(side: .right, name: .middle)] : "h",
        [Finger(side: .right, name: .ring)] : "i",
        [Finger(side: .right, name: .pinky)] : "j",
        
        [Finger(side: .left, name: .pinky), Finger(side: .right, name: .pinky)] : "k",
        [Finger(side: .left, name: .ring), Finger(side: .right, name: .ring)] : "l",
        [Finger(side: .left, name: .middle), Finger(side: .right, name: .middle)] : "m",
        [Finger(side: .left, name: .index), Finger(side: .right, name: .index)] : "n",
        [Finger(side: .left, name: .thumb), Finger(side: .right, name: .thumb)] : "o",

        [Finger(side: .left, name: .pinky), Finger(side: .left, name: .thumb)] : "p",
        [Finger(side: .left, name: .ring), Finger(side: .left, name: .thumb)] : "q",
        [Finger(side: .left, name: .middle), Finger(side: .left, name: .thumb)] : "r",
        [Finger(side: .left, name: .index), Finger(side: .left, name: .thumb)] : "s",
        
        [Finger(side: .right, name: .index), Finger(side: .right, name: .thumb)] : "t",
        [Finger(side: .right, name: .middle), Finger(side: .right, name: .thumb)] : "u",
        [Finger(side: .right, name: .ring), Finger(side: .right, name: .thumb)] : "v",
        [Finger(side: .right, name: .pinky), Finger(side: .right, name: .thumb)] : "w",
        
        [Finger(side: .left, name: .pinky), Finger(side: .left, name: .ring)] : "x",
        [Finger(side: .left, name: .middle), Finger(side: .left, name: .index)] : "y",
        [Finger(side: .right, name: .index), Finger(side: .right, name: .middle)] : "z",
    ]

    static func getLetter(_ fingers: Set<Finger>, isUpperCase: Bool) -> String? {
        let val = lowerCaseMap[fingers]
        if isUpperCase {
            if let lowercase = val {
                return lowercase.uppercased()
            }
        }
        return val
    }
}
