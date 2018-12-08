//
//  BaseViewController.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, TransitionController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let holder = sender as? TransitionConfigurationHolder {
            
            if let convertible = ((segue.destination as? UINavigationController)?.topViewController) as? AnyModuleInput {
                
                holder.configurationClosure(convertible)
            }
            else if let convertible = segue.destination as? AnyModuleInput {
                
                holder.configurationClosure(convertible)
            }
            else {
                
                fatalError("The destination view controller is not an instance of AnyModuleInputConvertible")
            }
        }
    }
}
