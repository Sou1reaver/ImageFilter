//
//  ImageEditModuleInput.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

protocol ImageEditModuleInput: AnyModuleInput {
    func setInitialImage(_ image: UIImage)
}

extension ImageEditModuleInput {
    func setInitialData<DataType>(_ data: DataType) {
        if let initialImage = data as? UIImage {
            setInitialImage(initialImage)
        }
    }
}
