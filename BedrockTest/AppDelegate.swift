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
        NetworkManager.shared.startReachabilityObserver()

        self.window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = ItemsListViewController(nibName: "ItemsListView", bundle: nil)
        let detailViewController = ItemDetailsViewController(nibName: "ItemDetailsView", bundle: nil)
        splitViewController.viewControllers = [
            UINavigationController(rootViewController: viewController),
            UINavigationController(rootViewController: detailViewController)
        ]

        guard let navigationController = splitViewController.viewControllers.last as? UINavigationController else { return false }
        navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        navigationController.topViewController?.navigationItem.leftItemsSupplementBackButton = true
        splitViewController.delegate = self

        self.window?.rootViewController = splitViewController

        self.window?.makeKeyAndVisible()

        return true
    }
}

extension AppDelegate: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard (secondaryAsNavController.topViewController as? ItemDetailsViewController) != nil else { return false }

        return true
    }

}
