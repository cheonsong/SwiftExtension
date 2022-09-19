import Foundation
import UIKit

extension UIColor {
    
    /// Easy Initializer With RGB
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0 ){
        let red = r / 255.0
        let green = g / 255.0
        let blue = b / 255.0
        self.init(red:red, green:green, blue:blue, alpha:a)
    }
    
    /// Easy Initializer With RGB (same RGB)
    convenience init(rgb: CGFloat, a: CGFloat = 1.0) {
        let rgb = rgb / 255.0
        self.init(red: rgb, green: rgb, blue: rgb, alpha:a)
    }
    
    /// Easy Initializer With HexString ("#000000")
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        if #available(iOS 13.0, *) {
            _ = scanner.scanString("#")
        } else {
            if (hex.hasPrefix("#")) {
              scanner.scanLocation = 1
            }
        }
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
    }
}
