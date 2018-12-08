//
//  ImageEditService.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit
import CoreImage

class ImageEditService {
    func applyFilter(_ filter: ImageFilter, to image: UIImage) -> UIImage? {
        
        guard let cgImage = image.fixOrientation()?.cgImage else { return nil }
        let ciImage = CIImage(cgImage: cgImage)
        let ciFilter = CIFilter(name: filter.name)
        let ciContext = CIContext()
        
        ciFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        for parameter in filter.parameters {
            ciFilter?.setValue(parameter.value, forKey: parameter.key)
        }
        
        if let outputImage = ciFilter?.outputImage,
           let cgResult = ciContext.createCGImage(outputImage, from: outputImage.extent) {
            
            return UIImage(cgImage: cgResult)
        }
        return nil
    }
}
