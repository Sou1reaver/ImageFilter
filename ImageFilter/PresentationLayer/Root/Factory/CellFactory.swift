//
//  CellFactory.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

public protocol AnyCellFactory {
    static var wrappedType: UIView.Type { get }
    
    var identifier: String { get }
    func setup(anyView: UIView)
}

public protocol CellFactory: AnyCellFactory {
    associatedtype ViewType: UIView
    func setup(view: ViewType)
}

extension CellFactory {
    public static var wrappedType: UIView.Type {
        return ViewType.self
    }
    
    public var identifier: String {
        return String(describing: type(of: self).wrappedType)
    }
    
    public func setup(anyView: UIView) {
        guard let view = anyView as? ViewType else { fatalError("Given cell is not an instance of \(String(describing: ViewType.self))") }
        setup(view: view)
    }
}
