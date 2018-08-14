//
//  Switcher.swift
//  iOSStarterProjectWithPods
//
//  Created by Feialoh Francis on 8/14/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

//import UIKit
//
//class Switcher {
//
//    static func updateRootViewController() {
//
//        let status = UserDefaults.standard.bool(forKey: Constants.kUserDefaults.isSignIn)
//        var rootViewController : UIViewController?
//
//        #if DEBUG
//        print(status)
//        #endif
//
//        if (status == true) {
//            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//            let mainTabBarController = mainStoryBoard.instantiateViewController(withIdentifier: Constants.ViewControllerId.mainTabBarController) as! MainTabBarController
//            rootViewController = mainTabBarController
//        } else {
//            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//            let signInViewController = mainStoryBoard.instantiateViewController(withIdentifier: Constants.ViewControllerId.signInViewController) as! SignInViewController
//            rootViewController = signInViewController
//        }
//        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = rootViewController
//
//    }
//
//}
