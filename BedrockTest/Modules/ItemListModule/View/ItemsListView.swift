//
//  ItemsListView.swift
//  BedrockTest
//
//  Created by Nicolas FAVRE on 04/08/2020.
//  Copyright © 2020 Nicolas FAVRE. All rights reserved.
//

import UIKit
import SDWebImage

class ItemsListViewController: UIViewController {
    var itemsList : JsonItems = []
    var itemsPresenter: ViewToPresenterItemsListProtocol?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "TextImageCell", bundle: nil), forCellReuseIdentifier: "textImageCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()

        print("Starting...")
        ItemsListRouter.createItemsListModule(viewController: self)
        print("Start Fetching...")
        itemsPresenter?.fetchItems()

    }
}

extension ItemsListViewController: PresenterToViewItemsListProtocol {
    func onItemsListResponseSuccess(itemsList: Array<JsonItem>) {
        self.itemsList = itemsList
        self.tableView.reloadData()
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
        cell.itemImage.sd_setImage(with: URL(string: jsonItem.imageURL), placeholderImage: UIImage(named: "photo.png"))
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
