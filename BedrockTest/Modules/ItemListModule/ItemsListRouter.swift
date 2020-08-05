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
        viewController.show(detailNavigationController, sender: self)// navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
