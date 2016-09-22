class LetterMapping {

    private static let lowerCaseMap: [Set<Finger>: String] = [
        [Finger(side: .Left, name: .Pinky)] : "a",
        [Finger(side: .Left, name: .Ring)] : "b",
        [Finger(side: .Left, name: .Middle)] : "c",
        [Finger(side: .Left, name: .Index)] : "d",
        [Finger(side: .Left, name: .Thumb)] : "e",
        [Finger(side: .Right, name: .Thumb)] : "f",
        [Finger(side: .Right, name: .Index)] : "g",
        [Finger(side: .Right, name: .Middle)] : "h",
        [Finger(side: .Right, name: .Ring)] : "i",
        [Finger(side: .Right, name: .Pinky)] : "j",
        
        [Finger(side: .Left, name: .Pinky), Finger(side: .Right, name: .Pinky)] : "k",
        [Finger(side: .Left, name: .Ring), Finger(side: .Right, name: .Ring)] : "l",
        [Finger(side: .Left, name: .Middle), Finger(side: .Right, name: .Middle)] : "m",
        [Finger(side: .Left, name: .Index), Finger(side: .Right, name: .Index)] : "n",
        [Finger(side: .Left, name: .Thumb), Finger(side: .Right, name: .Thumb)] : "o",

        [Finger(side: .Left, name: .Pinky), Finger(side: .Left, name: .Thumb)] : "p",
        [Finger(side: .Left, name: .Ring), Finger(side: .Left, name: .Thumb)] : "q",
        [Finger(side: .Left, name: .Middle), Finger(side: .Left, name: .Thumb)] : "r",
        [Finger(side: .Left, name: .Index), Finger(side: .Left, name: .Thumb)] : "s",
        
        [Finger(side: .Right, name: .Index), Finger(side: .Right, name: .Thumb)] : "t",
        [Finger(side: .Right, name: .Middle), Finger(side: .Right, name: .Thumb)] : "u",
        [Finger(side: .Right, name: .Ring), Finger(side: .Right, name: .Thumb)] : "v",
        [Finger(side: .Right, name: .Pinky), Finger(side: .Right, name: .Thumb)] : "w",
        
        [Finger(side: .Left, name: .Pinky), Finger(side: .Left, name: .Ring)] : "x",
        [Finger(side: .Left, name: .Middle), Finger(side: .Left, name: .Index)] : "y",
        [Finger(side: .Right, name: .Index), Finger(side: .Right, name: .Middle)] : "z",
    ]

    static func getLetter(fingers: Set<Finger>, isUpperCase: Bool) -> String? {
        let val = lowerCaseMap[fingers]
        if isUpperCase {
            if let lowercase = val {
                return lowercase.uppercaseString
            }
        }
        return val
    }
}
