//
//  ItemsListView.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit
import SDWebImage
import RxSwift

class ItemsListViewController: UIViewController, Theming {
    private var itemsList : JsonItems = []
    var itemsPresenter: ViewToPresenterItemsListProtocol?
    private let disposeBag = DisposeBag()
    private let refreshControl = UIRefreshControl()

    @IBOutlet weak var offlineLabel: UILabel!
    @IBOutlet weak var offlineView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var offlineIcon: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = theme.colors.viewBackground
        offlineLabel.textColor = theme.colors.text
        offlineLabel.text = "network.alert.content".localized
        offlineIcon.tintColor = theme.colors.icon
        setupTableView()

        print("Starting...")
        ItemsListRouter.createItemsListModule(viewController: self)
        print("Start Fetching...")
        NetworkManager.shared.isNetworkReachable
        .asDriver()
        .drive(onNext: { [weak self] isReachable in
            guard let self = self else { return }

            self.setupOffline(networkReachable: isReachable)
            if isReachable {
                self.itemsPresenter?.fetchItems()
            }

        }).disposed(by: disposeBag)

        title = "listView.title".localized
    }

    private func setupOffline(networkReachable: Bool) {
        offlineView.isHidden = networkReachable
        tableView.isHidden = !networkReachable
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: "TextImageCell", bundle: nil), forCellReuseIdentifier: "textImageCell")

        tableView.dataSource = self
        tableView.delegate = self
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "listView.refreshControl.title".localized)

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()

    }

    @objc private func loadData() {
        guard NetworkManager.shared.isNetworkReachable.value == true else {
            setupOffline(networkReachable: false)
            return
        }

        itemsPresenter?.fetchItems()
        refreshControl.endRefreshing()
    }
}

extension ItemsListViewController: PresenterToViewItemsListProtocol {
    func onItemsListResponseSuccess(itemsList: Array<JsonItem>) {
        self.itemsList = itemsList
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }

    func onItemsListResponseError(error: String) {
        print(error)
    }
}

extension ItemsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TextImageCell = tableView.dequeueReusableCell(withIdentifier: "textImageCell", for: indexPath) as? TextImageCell else { return UITableViewCell() }

        let jsonItem = itemsList[indexPath.row]
        cell.itemNameLabel.text = jsonItem.name
        cell.itemImage.sd_setImage(with: URL(string: jsonItem.imageURL), placeholderImage: #imageLiteral(resourceName: "photo.png"))
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return (itemsList.count > 0) ? 1 : 0
    }
}

extension ItemsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemsPresenter?.showItemSelection(with: itemsList[indexPath.row], from: self)
    }
}
