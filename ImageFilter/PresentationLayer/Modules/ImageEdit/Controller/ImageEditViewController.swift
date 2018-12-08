//
//  ImageEditViewController.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

class ImageEditViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private var image: UIImage! {
        didSet{
            imageView?.image = image
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        imageView.image = image
    }
    
    @IBAction func didTapCloseButton(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - ImageEditModuleInput
extension ImageEditViewController: ImageEditModuleInput {
    func setInitialImage(_ image: UIImage) {
        self.image = image
    }
}
