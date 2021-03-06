//
//  ItemsListRouter.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation
import UIKit

class ItemsListRouter: PresenterToRouterItemsListProtocol {
    class func createItemsListModule(viewController: ItemsListViewController) {
        let presenter: ViewToPresenterItemsListProtocol & InteractorToPresenterItemsListProtocol = ItemsListPresenter()

        viewController.itemsPresenter = presenter
        viewController.itemsPresenter?.router = ItemsListRouter()
        viewController.itemsPresenter?.view = viewController
        viewController.itemsPresenter?.interactor = ItemsListInteractor()
        viewController.itemsPresenter?.interactor?.presenter = presenter
    }

    func pushToItemDetails(with item: JsonItem, from viewController: UIViewController) {
        let detailsViewController = ItemDetailsViewController.init(item: item, nibName: "ItemDetailsView", bundle: nil)
        let detailNavigationController = UINavigationController(rootViewController: detailsViewController)
        ItemDetailsRouter.createItemDetailsModule(viewController: detailsViewController)
        detailsViewController.navigationItem.leftBarButtonItem = viewController.splitViewController?.displayModeButtonItem
        detailsViewController.navigationItem.leftItemsSupplementBackButton = true
        viewController.splitViewController?.toggleMasterView()
        viewController.showDetailViewController(detailNavigationController, sender: self)
    }
}
