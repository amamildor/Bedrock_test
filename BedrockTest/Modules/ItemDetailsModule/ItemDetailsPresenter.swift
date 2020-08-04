//
//  ItemDetailsPresenter.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation

class ItemDetailsPresenter: ViewToPresenterItemDetailsProtocol {
    var view: PresenterToViewItemDetailsProtocol?
    var interactor: PresenterToInteractorItemDetailsProtocol?
    var router: PresenterToRouterItemDetailsProtocol?

    func fetchItemDetails(itemName: String) {
        interactor?.loadItemDetails(itemName: itemName)
    }
}

extension ItemDetailsPresenter: InteractorToPresenterItemDetailsProtocol {
    func itemDetailsSuccess(itemDetails: JsonItem) {
        view?.onItemDetailsResponseSuccess(itemDetails: itemDetails)
    }

    func itemDetailsFailed() {
        view?.onItemDetailsResponseError(error: "error")
    }
}
