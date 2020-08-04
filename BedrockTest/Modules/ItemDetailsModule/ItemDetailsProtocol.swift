//
//  ItemDetailsProtocol.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation

protocol ViewToPresenterItemDetailsProtocol: class {
    var view: PresenterToViewItemDetailsProtocol? {get set}
    var interactor: PresenterToInteractorItemDetailsProtocol? {get set}
    var router: PresenterToRouterItemDetailsProtocol? {get set}

    func fetchItemDetails(itemName: String)
}

protocol PresenterToViewItemDetailsProtocol: class {
    func onItemDetailsResponseSuccess(itemDetails: JsonItem)
    func onItemDetailsResponseError(error: String)
}

protocol PresenterToRouterItemDetailsProtocol: class {
    static func createItemDetailsModule(viewController: ItemDetailsViewController)
}

protocol PresenterToInteractorItemDetailsProtocol: class {
    var presenter: InteractorToPresenterItemDetailsProtocol? { get set }
    func loadItemDetails(itemName: String)
}

protocol InteractorToPresenterItemDetailsProtocol: class {
    func itemDetailsSuccess(itemDetails: JsonItem)
    func itemDetailsFailed()
}
