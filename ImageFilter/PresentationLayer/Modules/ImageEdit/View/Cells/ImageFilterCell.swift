//
//  ImageFilterCell.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

struct ImageFilterCellModel {
    
    let title: String
    var selected: Bool
}

class ImageFilterCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

struct ImageFilterCellCellFactory: CellFactory {
    
    typealias ViewType = ImageFilterCell
    
    private let model: ImageFilterCellModel
    
    init(_ model: ImageFilterCellModel) {
        
        self.model = model
    }
    
    func setup(view: ImageFilterCell) {
        
        view.titleLabel.text = model.title
        view.accessoryType = model.selected == true ? .checkmark : .none
    }
}
