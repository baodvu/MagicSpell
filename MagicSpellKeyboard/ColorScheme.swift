import UIKit

struct ColorScheme {
    
    var name: String
    fileprivate var colorMap: [Finger: UIColor]
    fileprivate let defaultColor = UIColor.lightGray
    
    // Init with one single UIColor - every key has the same color
    init(_ name: String, color: UIColor) {
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

    // Init with an array of colors in hex.
    // If the array length is less than 10, we will just reuse the colors.
    init(_ name: String, colors: [Int]) {
        assert(colors.count > 0, "Must pass in at least 1 color.")
        
        self.name = name
        colorMap = [Finger: UIColor]()
        colorMap[Finger(side: .left, name: .pinky)] = UIColor.init(hex: colors[0 % colors.count])
        colorMap[Finger(side: .left, name: .ring)] = UIColor.init(hex: colors[1 % colors.count])
        colorMap[Finger(side: .left, name: .middle)] = UIColor.init(hex: colors[2 % colors.count])
        colorMap[Finger(side: .left, name: .index)] = UIColor.init(hex: colors[3 % colors.count])
        colorMap[Finger(side: .left, name: .thumb)] = UIColor.init(hex: colors[4 % colors.count])
        colorMap[Finger(side: .right, name: .pinky)] = UIColor.init(hex: colors[5 % colors.count])
        colorMap[Finger(side: .right, name: .ring)] = UIColor.init(hex: colors[6 % colors.count])
        colorMap[Finger(side: .right, name: .middle)] = UIColor.init(hex: colors[7 % colors.count])
        colorMap[Finger(side: .right, name: .index)] = UIColor.init(hex: colors[8 % colors.count])
        colorMap[Finger(side: .right, name: .thumb)] = UIColor.init(hex: colors[9 % colors.count])
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
    // Default - black and white
    static var defaultBW : ColorScheme {
        get { return ColorScheme.init("Monochrome", color: UIColor.lightGray.lighter(15.0)!) }
    }
    
    // Creator: Drew
    static var rainbow : ColorScheme {
        get { return ColorScheme.init("Rainbow", colors: [0xf0adad, 0xfff6b3, 0xb8deb9, 0xa7d5fa, 0xd6a9de]) }
    }
    
    // Creator: Bao
    static var paper : ColorScheme {
        get { return ColorScheme.init("Paper", colors: [0xd5c0f0, 0xb1dfe0, 0xdeda8c, 0xf7c48d, 0xf0bbb4]) }
    }
}

extension UIColor {

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
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
