//
//  ItemDetailsView.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit
import SDWebImage
import RxSwift

class ItemDetailsViewController: UIViewController, Theming {
    var jsonItemName : String
    var itemDetailsPresenter: ViewToPresenterItemDetailsProtocol?
    let disposeBag = DisposeBag()

    @IBOutlet weak var itemTextLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!

    init(item: JsonItem, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.jsonItemName = item.name
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.jsonItemName = ""
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = theme.colors.viewBackground

        NetworkManager.shared.isNetworkReachable
        .asDriver()
        .drive(onNext: { [weak self] isReachable in
            guard let self = self else { return }

            if isReachable {
                self.itemDetailsPresenter?.fetchItemDetails(itemName: self.jsonItemName)
            } else {
                let alert = UIAlertController(title: "network.alert.title".localized, message: "network.alert.content".localized, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "alert.button.ok".localized, style: .default, handler: nil))

                self.present(alert, animated: true)
            }

        }).disposed(by: disposeBag)

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
