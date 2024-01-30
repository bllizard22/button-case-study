import Foundation
import UIKit

public enum ColorPalette {
    public static let trvBrandBlue = UIColor(rgbHex: 0x1391D2)
    public static let trvBrandOrange = UIColor(rgbHex: 0xFC9E15)
    public static let trvBrandRed = UIColor(rgbHex: 0xE3403D)

    static let trvGreen_100 = UIColor(rgbHex: 0xECF3E6)
    static let trvGreen_700 = UIColor(rgbHex: 0x428500)
    static let trvGreen_900 = UIColor(rgbHex: 0x316300)

    static let trvBlue_100 = UIColor(rgbHex: 0xE5F2F6)
    static let trvBlue_700 = UIColor(rgbHex: 0x007FAD)
    static let trvBlue_900 = UIColor(rgbHex: 0x005F81)

    static let neutralsWhite = UIColor(rgbHex: 0xFFFFFF)

    static let trvJuri_300 = UIColor(rgbHex: 0x9BA2A6)
}

extension UIColor {
    convenience init(rgbHex: Int) {
        let red = CGFloat((rgbHex >> 16) & 0xFF) / CGFloat(0xFF)
        let green = CGFloat((rgbHex >> 8) & 0xFF) / CGFloat(0xFF)
        let blue = CGFloat((rgbHex >> 0) & 0xFF) / CGFloat(0xFF)

        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
