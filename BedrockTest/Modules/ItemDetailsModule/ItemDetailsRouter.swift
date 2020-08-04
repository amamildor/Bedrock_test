//
//  ItemDetailsRouter.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class ItemDetailsRouter: PresenterToRouterItemDetailsProtocol {
    static func createItemDetailsModule(viewController: ItemDetailsViewController) {
        let presenter: ViewToPresenterItemDetailsProtocol & InteractorToPresenterItemDetailsProtocol = ItemDetailsPresenter()
        viewController.itemDetailsPresenter = presenter
        viewController.itemDetailsPresenter?.router = ItemDetailsRouter()
        viewController.itemDetailsPresenter?.view = viewController
        viewController.itemDetailsPresenter?.interactor = ItemDetailsInteractor()
        viewController.itemDetailsPresenter?.interactor?.presenter = presenter
    }
}
