//
//  ActivityViewControllerShowing.swift
//  ImageFilter
//
//  Created by Vladimir Gordienko on 08/12/2018.
//  Copyright © 2018 Vladimir Gordienko. All rights reserved.
//

import UIKit

protocol ActivityViewControllerShowing {
    func openActivityViewController(with activityItems: [Any],
                                    excludedActivityTypes: [UIActivity.ActivityType]?,
                                    completionWithItemsHandler: UIActivityViewController.CompletionWithItemsHandler?)
}

extension ActivityViewControllerShowing where Self: UIViewController {
    func openActivityViewController(with activityItems: [Any],
                                    excludedActivityTypes: [UIActivity.ActivityType]?,
                                    completionWithItemsHandler: UIActivityViewController.CompletionWithItemsHandler?) {
        
        
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityViewController.completionWithItemsHandler = completionWithItemsHandler
        activityViewController.popoverPresentationController?.sourceView = view
        activityViewController.popoverPresentationController?.sourceRect = view.frame
        
        activityViewController.excludedActivityTypes = excludedActivityTypes
        present(activityViewController, animated: true, completion: nil)
    }
}

