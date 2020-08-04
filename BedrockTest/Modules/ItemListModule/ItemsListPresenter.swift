//
//  ItemsListPresenter.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation
import UIKit

class ItemsListPresenter: ViewToPresenterItemsListProtocol {
    var view: PresenterToViewItemsListProtocol?
    var interactor: PresenterToInteractorItemsListProtocol?
    var router: PresenterToRouterItemsListProtocol?

    func fetchItems() {
        interactor?.loadItems()
    }

    func showItemSelection(with item: JsonItem, from view: UIViewController) {
        router?.pushToItemDetails(with: item, from: view)
    }
}

extension ItemsListPresenter: InteractorToPresenterItemsListProtocol {
    func itemsSuccess(itemsList: Array<JsonItem>) {
        view?.onItemsListResponseSuccess(itemsList: itemsList)
    }

    func itemsFailed() {
        view?.onItemsListResponseError(error: "error")
    }
}
