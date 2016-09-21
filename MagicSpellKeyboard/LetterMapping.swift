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
    
    private static let upperCaseMap: [Set<Finger>: String] = [
        [Finger(side: .Left, name: .Pinky)] : "A",
        [Finger(side: .Left, name: .Ring)] : "B",
        [Finger(side: .Left, name: .Middle)] : "C",
        [Finger(side: .Left, name: .Index)] : "D",
        [Finger(side: .Left, name: .Thumb)] : "E",
        [Finger(side: .Right, name: .Thumb)] : "F",
        [Finger(side: .Right, name: .Index)] : "G",
        [Finger(side: .Right, name: .Middle)] : "H",
        [Finger(side: .Right, name: .Ring)] : "I",
        [Finger(side: .Right, name: .Pinky)] : "J",
        
        [Finger(side: .Left, name: .Pinky), Finger(side: .Right, name: .Pinky)] : "K",
        [Finger(side: .Left, name: .Ring), Finger(side: .Right, name: .Ring)] : "L",
        [Finger(side: .Left, name: .Middle), Finger(side: .Right, name: .Middle)] : "M",
        [Finger(side: .Left, name: .Index), Finger(side: .Right, name: .Index)] : "N",
        [Finger(side: .Left, name: .Thumb), Finger(side: .Right, name: .Thumb)] : "O",
        
        [Finger(side: .Left, name: .Pinky), Finger(side: .Left, name: .Thumb)] : "P",
        [Finger(side: .Left, name: .Ring), Finger(side: .Left, name: .Thumb)] : "Q",
        [Finger(side: .Left, name: .Middle), Finger(side: .Left, name: .Thumb)] : "R",
        [Finger(side: .Left, name: .Index), Finger(side: .Left, name: .Thumb)] : "S",
        
        [Finger(side: .Right, name: .Index), Finger(side: .Right, name: .Thumb)] : "T",
        [Finger(side: .Right, name: .Middle), Finger(side: .Right, name: .Thumb)] : "U",
        [Finger(side: .Right, name: .Ring), Finger(side: .Right, name: .Thumb)] : "V",
        [Finger(side: .Right, name: .Pinky), Finger(side: .Right, name: .Thumb)] : "W",
        
        [Finger(side: .Left, name: .Pinky), Finger(side: .Left, name: .Ring)] : "X",
        [Finger(side: .Left, name: .Middle), Finger(side: .Left, name: .Index)] : "Y",
        [Finger(side: .Right, name: .Index), Finger(side: .Right, name: .Middle)] : "Z",
        ]

    
    static func getLowerLetter(fingers: Set<Finger>) -> String? {
        return lowerCaseMap[fingers]
    }
    
    static func getUpperLetter(fingers: Set<Finger>) -> String? {
        return upperCaseMap[fingers]
    }
}
