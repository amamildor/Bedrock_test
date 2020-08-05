//
//  AppDelegate.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 03/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let splitViewController = UISplitViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        splitViewController.preferredDisplayMode = .allVisible

        let viewController = ItemsListViewController(nibName: "ItemsListView", bundle: nil)
        let detailViewController = ItemDetailsViewController(nibName: "ItemDetailsView", bundle: nil)
        splitViewController.viewControllers = [
            UINavigationController(rootViewController: viewController),
            UINavigationController(rootViewController: detailViewController)
        ]
        splitViewController.delegate = self
        self.window?.rootViewController = splitViewController

        self.window?.makeKeyAndVisible()

        return true
    }
}

extension AppDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
