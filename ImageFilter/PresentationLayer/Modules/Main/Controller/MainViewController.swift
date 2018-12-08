//
//  MainViewController.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, MediaSource {

    lazy var imagePicker: UIImagePickerController = {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        return picker
    }()
    
    //MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkPhotoLibraryPermission()
        checkCameraPermission()
    }
    
    //MARK: - Actions
    @IBAction func didTapCameraButton(_ sender: UIButton) {
        openCamera()
    }
    
    @IBAction func didTapGalleryButton(_ sender: UIButton) {
        openGallery()
    }
    
    func openImageEditModule(with image: UIImage) {
        
        showModule(performingSegueWithIdentifier: "toImageEdit") { (moduleInput) in
            
            moduleInput.setInitialData(image)
        }
    }
}

// MARK: - UIImagePickerControllerDelegate
extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            picker.dismiss(animated: true, completion: nil)
            return
        }
        picker.dismiss(animated: true) { [weak self] in
            self?.openImageEditModule(with: pickedImage)
        }

    }
}
