//
//  ImageEditViewController.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

class ImageEditViewController: BaseViewController, ActivityViewControllerShowing {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private var initialImage: UIImage!
    private var image: UIImage! {
        didSet{
            imageView?.image = image
        }
    }
    
    private let filters = ImageFilters.allCases
    
    private lazy var imageEditService: ImageEditService = {
        return ImageEditService()
    }()
    
    // MARK: - DisplayManager
    private lazy var displayManager: ImageEditDisplayManager = {
        
        let displayManager = ImageEditDisplayManager(tableView: tableView, delegate: self)
        return displayManager
    }()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imageView.image = image
        displayManager.setItems(buildCells(selectedIndex: max(0, filters.count-1)))
    }
    
    private func buildCells(selectedIndex: Int) -> [ImageFilterCellModel] {
        var cells: [ImageFilterCellModel] = []
        filters.enumerated().forEach( {
            let selected = selectedIndex == $0.offset ? true : false
            cells.append(ImageFilterCellModel(title: $0.element.rawValue, selected: selected))
        })
        return cells
    }
    
    @IBAction func didTapShareButton(_ sender: UIButton) {

        openActivityViewController(with: [image], excludedActivityTypes: nil, completionWithItemsHandler: nil)
    }
    
    @IBAction func didTapCloseButton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - ImageEditModuleInput
extension ImageEditViewController: ImageEditModuleInput {
    func setInitialImage(_ image: UIImage) {
        self.initialImage = image
        self.image = image
    }
}

//MARK: - ImageEditDisplayManagerDelegate
extension ImageEditViewController: ImageEditDisplayManagerDelegate {
    func imageEditDisplayManager(_ manager: ImageEditDisplayManager, didSelectItem index: Int) {
        if let value = filters[index].value {
            self.image = imageEditService.applyFilter(value, to: initialImage)
        } else {
            self.image = self.initialImage
        }
         displayManager.setItems(buildCells(selectedIndex: index))
    }
}
