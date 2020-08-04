//
//  ItemDetailsInteractor.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import Foundation

class ItemDetailsInteractor: PresenterToInteractorItemDetailsProtocol {
    var presenter: InteractorToPresenterItemDetailsProtocol?

    func loadItemDetails(itemName: String) {
        TappticService.getJsonItemDetails(with: itemName) { (item, error) in
            if error == nil {
                self.presenter?.itemDetailsSuccess(itemDetails: item!)
            } else {
                self.presenter?.itemDetailsFailed()
            }
        }
    }
}
