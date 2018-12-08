//
//  UITableView+Factory.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

public extension UITableView {
    func dequeueReusableCell(withFactory factory: AnyCellFactory, for indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: factory.identifier, for: indexPath)
        factory.setup(anyView: cell)
        
        return cell
    }
    
    func dequeueReusableCell(withFactory factory: AnyCellFactory) -> UITableViewCell? {
        guard let cell = dequeueReusableCell(withIdentifier: factory.identifier) else { return nil }
        factory.setup(anyView: cell)
        
        return cell
    }
    
    func registerCells(nibModels: [AnyCellFactory.Type]) {
        nibModels.forEach {
            let id = String(describing: $0.wrappedType)
            let nib = UINib(nibName: id, bundle: nil)
            register(nib, forCellReuseIdentifier: id)
        }
    }
    
    func registerCell(nibModel: AnyCellFactory.Type) {
        registerCells(nibModels: [nibModel])
    }
}

