//
//  ItemDetailsView.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {
    var jsonItem : JsonItem? = nil
    var itemDetailsPresenter: ViewToPresenterItemDetailsProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ItemDetailsViewController: PresenterToViewItemDetailsProtocol {
    func onItemDetailsResponseSuccess(itemDetails: JsonItem) {
        self.jsonItem = itemDetails
        //configure view
    }

    func onItemDetailsResponseError(error: String) {
        print(error)
    }
}
