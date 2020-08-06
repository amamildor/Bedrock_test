//
//  UIViewController+Extension.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 06/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit

public extension UIViewController {
    func showNetworkAlert() {
        let alert = UIAlertController(title: "network.alert.title".localized, message: "network.alert.content".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "alert.button.ok".localized, style: .default, handler: nil))

        self.present(alert, animated: true)
    }
}
