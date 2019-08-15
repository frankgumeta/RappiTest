//
//  TableViewManager.swift
//  RappiTest
//
//  Created by Francisco Eduardo Toledo Gumeta on 8/12/19.
//  Copyright © 2019 Frank Gumeta. All rights reserved.
//
import UIKit

final class TableViewManager<GenericCell: UITableViewCell, ViewModel> : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private(set) var cellConfigurationBlock: (GenericCell, ViewModel) -> ()
    private(set) var cellSelectorHandler: (ViewModel) -> ()
    private let cellIdentifier: String
    private var cellItems: [ViewModel]

    init(_ cellIdentifier: String,
         _ items: [ViewModel] ,
         cellConfigurationBlock : @escaping (GenericCell, ViewModel) -> (),
         cellSelectorHandler    : @escaping (ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.cellItems = items
        self.cellConfigurationBlock = cellConfigurationBlock
        self.cellSelectorHandler = cellSelectorHandler
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? GenericCell else {
            return UITableViewCell()
        }
        let item = cellItems[indexPath.row]
        self.cellConfigurationBlock(cell, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = cellItems[indexPath.row]
        self.cellSelectorHandler(item)
    }
}

