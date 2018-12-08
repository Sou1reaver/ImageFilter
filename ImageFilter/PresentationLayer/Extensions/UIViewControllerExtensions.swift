//
//  UIViewControllerExtensions.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

extension UIViewController: ShowAlert {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController: PhotoLibraryPermissionsReachability {
    func checkPhotoLibraryPermission() {
        checkPhotoLibraryAuthorizationStatus { [weak self] (success) in
            if !success {
                self?.showAlert(message: "ImageFilter doesn't have permission to use the photo library, please change privacy settings")
            }
        }
    }
}

extension UIViewController: CameraPermissionsReachability {
    func checkCameraPermission() {
        checkCameraAuthorizationStatus {  [weak self] (success) in
            if !success {
                self?.showAlert(message: "ImageFilter doesn't have permission to use the camera, please change privacy settings")
            }
        }
    }
}
