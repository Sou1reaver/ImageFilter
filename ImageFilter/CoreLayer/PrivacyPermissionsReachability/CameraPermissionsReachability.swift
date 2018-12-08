//
//  CameraPermissionsReachability.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import AVFoundation


protocol CameraPermissionsReachability {
    
}


extension CameraPermissionsReachability {
    func checkCameraAuthorizationStatus (completionsHandler: ((_ isReachable: Bool) -> Swift.Void)?) {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authorizationStatus {
        case .authorized:
            completionsHandler?(true)
            break
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video,
                                          completionHandler: { granted in
                                            completionsHandler?(granted)
                                            
            })
        default:
            completionsHandler?(false)
        }
    }
}
