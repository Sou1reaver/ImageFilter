//
//  ImageEditDisplayManager.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

protocol ImageEditDisplayManagerDelegate: class {
    func imageEditDisplayManager(_ manager: ImageEditDisplayManager, didSelectItem index: Int)
}

public final class ImageEditDisplayManager: NSObject {
    
    private weak var tableView: UITableView?
    private weak var delegate: ImageEditDisplayManagerDelegate?
    private var items: [ImageFilterCellModel] = []
    
    // MARK: - Methods
    init(tableView: UITableView, delegate: ImageEditDisplayManagerDelegate) {
        
        super.init()
        self.delegate = delegate
        self.tableView = tableView
        tableView.registerCell(nibModel: ImageFilterCellCellFactory.self)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
    
    func setItems(_ items: [ImageFilterCellModel]) {
        self.items = items
        tableView?.reloadData()
    }
    
}

// MARK: UITableViewDataSource
extension ImageEditDisplayManager: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = items[indexPath.row]
        let factory = ImageFilterCellCellFactory(item)
        let cell = tableView.dequeueReusableCell(withFactory: factory, for: indexPath)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ImageEditDisplayManager: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.imageEditDisplayManager(self, didSelectItem: indexPath.row)
    }
}
