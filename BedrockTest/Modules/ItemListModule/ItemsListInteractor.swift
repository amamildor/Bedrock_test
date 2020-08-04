//
//  ItemsListInteractor.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation

class ItemsListInteractor: PresenterToInteractorItemsListProtocol {
    var presenter: InteractorToPresenterItemsListProtocol?

    func loadItems() {
        TappticService.getJsonItems() { (list, error) in
            if error == nil {
                self.presenter?.itemsSuccess(itemsList: list!)
            } else {
                self.presenter?.itemsFailed()
            }
        }
    }
}
