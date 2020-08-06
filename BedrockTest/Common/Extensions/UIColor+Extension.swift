//
//  UIColor+Extension.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 06/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(lightColor: UIColor, darkColor: UIColor) {
        guard #available(iOS 13, *) else {
            self.init(cgColor: lightColor.cgColor)
            return
        }

        self.init { traitCollection in
            traitCollection.userInterfaceStyle == .dark ? darkColor : lightColor
        }
    }

    convenience init(hex: Int) {
        self.init(hex: hex, alpha: 1)
    }

    convenience init(hex: Int, alpha: Double) {
        self.init(
            red: CGFloat((hex >> 16) & 0xff) / 255,
            green: CGFloat((hex >> 8) & 0xff) / 255,
            blue: CGFloat(hex & 0xff) / 255,
            alpha: CGFloat(alpha)
        )
    }
}

protocol AdaptiveColors {
    var text: UIColor { get }
    var icon: UIColor { get }
    var cellBackground: UIColor { get }
    var cellHighlightBackground: UIColor { get }
    var cellSelectBackground: UIColor { get }
    var viewBackground: UIColor { get }
    var offlineBackground: UIColor { get }
}

extension AdaptiveColors {
    var text: UIColor { UIColor(lightColor: UIColor(hex: 0x1b1b2f), darkColor: UIColor(hex: 0xececec)) }
    var icon: UIColor { UIColor(lightColor: UIColor(hex: 0x11BAD5), darkColor: UIColor(hex: 0x11BAD5)) }
    var cellBackground: UIColor { UIColor(lightColor: UIColor(hex: 0xFFFFFF), darkColor: UIColor(hex: 0x000000)) }
    var cellHighlightBackground: UIColor { UIColor(lightColor: UIColor(hex: 0x21e6c1), darkColor: UIColor(hex: 0x219897)) }
    var cellSelectBackground: UIColor { UIColor(lightColor: UIColor(hex: 0xff0000), darkColor: UIColor(hex: 0xaf0404)) }
    var viewBackground: UIColor { UIColor(lightColor: UIColor(hex: 0xFFFFFF), darkColor: UIColor(hex: 0x000000)) }
    var offlineBackground: UIColor { UIColor(lightColor: UIColor(hex: 0xFFFFFF), darkColor: UIColor(hex: 0x000000)) }
}

struct DefaultColors: AdaptiveColors {

}
