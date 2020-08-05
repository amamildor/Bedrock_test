//
//  SplitViewContainer.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 05/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit

class SplitViewContainer: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func overrideTraitCollection(forChild childViewController: UIViewController) -> UITraitCollection? {
        if UIDevice.current.userInterfaceIdiom != .pad || (UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation == .portrait) {
            return UITraitCollection(horizontalSizeClass: .compact)
        } else {
            return super.traitCollection
        }
    }
}

extension SplitViewContainer: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
