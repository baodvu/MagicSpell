import UIKit

struct ColorScheme {
    
    var name: String
    fileprivate var colorMap: [Finger: UIColor]
    fileprivate var defaultColor = UIColor.lightGray
    
    // Init with one single color - every key has the same color
    init(named name: String, color: UIColor) {
        self.name = name
        colorMap = [
            Finger(side: .left, name: .pinky) : color,
            Finger(side: .left, name: .ring) : color,
            Finger(side: .left, name: .middle) : color,
            Finger(side: .left, name: .index) : color,
            Finger(side: .left, name: .thumb) : color,
            Finger(side: .right, name: .thumb) : color,
            Finger(side: .right, name: .index) : color,
            Finger(side: .right, name: .middle) : color,
            Finger(side: .right, name: .ring) : color,
            Finger(side: .right, name: .pinky) : color
        ]
    }
    
    // Init with colors for a single hand - the other hand will use the same colors
    init(named name: String, color1: UIColor, color2: UIColor, color3: UIColor, color4: UIColor, color5: UIColor) {
        self.name = name
        colorMap = [
            Finger(side: .left, name: .pinky) : color1,
            Finger(side: .left, name: .ring) : color2,
            Finger(side: .left, name: .middle) : color3,
            Finger(side: .left, name: .index) : color4,
            Finger(side: .left, name: .thumb) : color5,
            Finger(side: .right, name: .thumb) : color5,
            Finger(side: .right, name: .index) : color4,
            Finger(side: .right, name: .middle) : color3,
            Finger(side: .right, name: .ring) : color2,
            Finger(side: .right, name: .pinky) : color1
        ]
    }
    
    func getColor(_ finger: Finger) -> UIColor {
        if let color = colorMap[finger] {
            return color
        }
        return defaultColor
    }

    func getDarkerColor(_ finger: Finger) -> UIColor {
        return self.getColor(finger).darker(10.0)!
    }
    
    // MARK: Color schemes
    
    static func defaultMonochrome() -> ColorScheme {
        return ColorScheme.init(named: "Monochrome", color: UIColor.lightGray.lighter(15.0)!)
    }
    
    // Creator: Drew
    static func defaultPolychrome() -> ColorScheme {
        return ColorScheme.init(named: "Default",
                                color1: UIColor(red: 240/255, green: 173/255, blue: 173/255, alpha: 1.0) /* #f0adad */,
            color2: UIColor(red: 255/255, green: 246/255, blue: 179/255, alpha: 1.0) /* #fff6b3 */,
            color3: UIColor(red: 184/255, green: 222/255, blue: 185/255, alpha: 1.0) /* #b8deb9 */,
            color4: UIColor(red: 167/255, green: 213/255, blue: 250/255, alpha: 1.0) /* #a7d5fa */,
            color5: UIColor(red: 214/255, green: 169/255, blue: 222/255, alpha: 1.0) /* #d6a9de */)
    }
    
    // Creator: Bao
    static func paper() -> ColorScheme {
        return ColorScheme.init(named: "Paper",
                                color1: UIColor(red: 213/255, green: 192/255, blue: 240/255, alpha: 1.0) /* #d5c0f0 */,
            color2: UIColor(red: 177/255, green: 223/255, blue: 224/255, alpha: 1.0) /* #b1dfe0 */,
            color3: UIColor(red: 222/255, green: 218/255, blue: 140/255, alpha: 1.0) /* #deda8c */,
            color4: UIColor(red: 247/255, green: 196/255, blue: 141/255, alpha: 1.0) /* #f7c48d */,
            color5: UIColor(red: 240/255, green: 187/255, blue: 180/255, alpha: 1.0) /* #f0bbb4 */)
    }
}

extension UIColor {
    
    func lighter(_ percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust( abs(percentage) )
    }
    
    func darker(_ percentage:CGFloat=30.0) -> UIColor? {
        return self.adjust( -1 * abs(percentage) )
    }
    
    func adjust(_ percentage:CGFloat=30.0) -> UIColor? {
        var r:CGFloat=0, g:CGFloat=0, b:CGFloat=0, a:CGFloat=0;
        if (self.getRed(&r, green: &g, blue: &b, alpha: &a)){
            return UIColor(red: min(r + percentage/100, 1.0),
                           green: min(g + percentage/100, 1.0),
                           blue: min(b + percentage/100, 1.0),
                           alpha: a)
        } else {
            return nil
        }
    }
}
