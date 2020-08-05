//
//  ItemDetailsView.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit
import SDWebImage

class ItemDetailsViewController: UIViewController {
    var jsonItemName : String
    var itemDetailsPresenter: ViewToPresenterItemDetailsProtocol?

    @IBOutlet weak var itemTextLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!

    init(item: JsonItem, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.jsonItemName = item.name
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        itemDetailsPresenter?.fetchItemDetails(itemName: jsonItemName)

        self.title = String(format: "detailsListView.title".localized, jsonItemName)
    }
}

extension ItemDetailsViewController: PresenterToViewItemDetailsProtocol {
    func onItemDetailsResponseSuccess(itemDetails: JsonItemDetails) {
        itemTextLabel.text = itemDetails.text
        itemImage.sd_setImage(with: URL(string: itemDetails.imageURL), placeholderImage: UIImage(named: "photo.png"))
    }

    func onItemDetailsResponseError(error: String) {
        print(error)
    }
}
