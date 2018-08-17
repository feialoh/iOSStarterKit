//
//  Navigator.swift
//  iOSStarterKit
//
//  Created by Feialoh Francis on 8/14/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

import UIKit

class Navigator: NSObject {
    
    static func moveTo(_ destinationViewController: UIViewController, from sourceViewController: UIViewController, transitionStyle: UIModalTransitionStyle? = .crossDissolve, completion: (() -> ())? = nil) {
        
        DispatchQueue.main.async {
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                
                destinationViewController.modalTransitionStyle = (transitionStyle ?? nil)!
                sourceViewController.present(destinationViewController, animated: true, completion: completion)
            }
        }
    }
}
