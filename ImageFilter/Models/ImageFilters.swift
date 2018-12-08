//
//  ImageFilters.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation
import CoreImage

enum ImageFilters: String, CaseIterable {
    case sepia = "Sepia"
    case noir = "Noir"
    case none = "None"
    
    var value: ImageFilter? {
        switch self {
        case .sepia:
            return ImageFilter.sepia
        case .noir:
            return ImageFilter.noir
        case .none:
            return nil
        }
    }
}


struct ImageFilter {
    let name: String
    let parameters: [String:Any]
    
    static let sepia = ImageFilter(name: "CISepiaTone", parameters: [kCIInputIntensityKey:0.8])
    static let noir = ImageFilter(name: "CIPhotoEffectNoir", parameters: [:])
}

