//
//  AnyModuleInputConvertible.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import Foundation

protocol AnyModuleInput: class {
    func setInitialData<DataType>(_ data: DataType)
}
