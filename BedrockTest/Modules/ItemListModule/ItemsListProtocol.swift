//
//  ItemsListProtocol.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterItemsListProtocol: class {
    var view: PresenterToViewItemsListProtocol? {get set}
    var interactor: PresenterToInteractorItemsListProtocol? {get set}
    var router: PresenterToRouterItemsListProtocol? {get set}

    func fetchItems()
    func showItemSelection(with item: JsonItem, from view: UIViewController)
}

protocol PresenterToViewItemsListProtocol: class {
    func onItemsListResponseSuccess(itemsList: Array<JsonItem>)
    func onItemsListResponseError(error: String)
}

protocol PresenterToRouterItemsListProtocol: class {
    static func createItemsListModule(viewController: ItemsListViewController)
    func pushToItemDetails(with item: JsonItem, from viewController: UIViewController) 
}

protocol PresenterToInteractorItemsListProtocol: class {
    var presenter: InteractorToPresenterItemsListProtocol? { get set }
    func loadItems()
}

protocol InteractorToPresenterItemsListProtocol: class {
    func itemsSuccess(itemsList: Array<JsonItem>)
    func itemsFailed()
}
