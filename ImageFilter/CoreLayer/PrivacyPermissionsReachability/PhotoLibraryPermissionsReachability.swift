//
//  PhotoLibraryPermissionsReachability.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Photos

protocol PhotoLibraryPermissionsReachability {
    
}

extension PhotoLibraryPermissionsReachability {
    func checkPhotoLibraryAuthorizationStatus (completionsHandler: ((_ isReachable: Bool) -> Swift.Void)?) {
        let authorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch authorizationStatus {
        case .authorized:
            completionsHandler?(true)
            break
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (status) in
                completionsHandler?(status == .authorized)
            })
        default:
            completionsHandler?(false)
        }
    }
}
