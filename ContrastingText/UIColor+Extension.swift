//
//  UIColor+Extension.swift
//  ContrastingText
//
//  Created by Sreekuttan D on 22/09/23.
//

import UIKit

extension UIColor {
    
    convenience init(
        light lightModeColor: @escaping @autoclosure () -> UIColor,
        dark darkModeColor: @escaping @autoclosure () -> UIColor
     ) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light:
                return lightModeColor()
            case .dark:
                return darkModeColor()
            case .unspecified:
                return lightModeColor()
            @unknown default:
                return lightModeColor()
            }
        }
    }
    
    /// returns a random color for dark and light mode
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
    
    /// returns true if is a dark color
    var isDarkColor: Bool {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  lum < 0.45
    }
    
    /// Generates contrasting color for dark and light userInterfaceStyles
    /// - Returns: UIColor.white for dark colors else return UIColor.black
    func contrastingColor() -> UIColor {
        let dark = self.resolvedColor(with: UITraitCollection(userInterfaceStyle: .dark))
        let light = self.resolvedColor(with: UITraitCollection(userInterfaceStyle: .light))
        
        return UIColor(light: light.isDarkColor ? .white : .black,
                       dark: dark.isDarkColor ? .white : .black)
    }
    
}
