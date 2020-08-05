//
//  String+Extension.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 05/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
