//
//  UISplitViewController+Extension.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 05/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit

extension UISplitViewController {
    ///used to collapse master view automatically when iPad in portrait
    func toggleMasterView() {
        let barButtonItem = displayModeButtonItem
        UIApplication.shared.sendAction(barButtonItem.action!, to: barButtonItem.target, from: nil, for: nil)
    }
}
