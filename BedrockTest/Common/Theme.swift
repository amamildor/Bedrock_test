//
//  Theme.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 06/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation

protocol Theming {
    var theme: Theme { get }
}

extension Theming {
    var theme: Theme {
        return Theme.default
    }
}

import UIKit

extension UIView: Theming { }

class Theme {
    static var `default` = Theme()

    var colors: AdaptiveColors {
        return DefaultColors()
    }

    private init() {}
}
