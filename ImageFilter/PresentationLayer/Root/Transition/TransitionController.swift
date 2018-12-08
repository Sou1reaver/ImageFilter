//
//  TransitionController.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

protocol TransitionController {
    
    func showModule(performingSegueWithIdentifier id: String,
                    configuration: ((AnyModuleInput) -> Void)?)
}

extension TransitionController where Self: UIViewController {
    
    func showModule(performingSegueWithIdentifier id: String,
                    configuration: ((AnyModuleInput) -> Void)?) {
        
        if let conf = configuration {
            let holder = TransitionConfigurationHolder(configurationClosure: conf)
            performSegue(withIdentifier: id, sender: holder)
        } else {
            performSegue(withIdentifier: id, sender: nil)
        }
    }
}
