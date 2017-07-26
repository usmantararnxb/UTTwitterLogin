//
//  UIViewController+SLSocialLogin.swift
//  SocialLogin
//
//  Created by Usman Tarar on 20/07/2017.
//  Copyright © 2017 Usman Tarar. All rights reserved.
//

import UIKit


//MARK: - UIController
public extension UIViewController {
    
    /// Extension method to get Top View Controller of App
    class func topVC(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let navigationController = controller as? UINavigationController {
            return topVC(controller: navigationController.visibleViewController)
        }
        
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topVC(controller: selected)
            }
        }
        
        if let presented = controller?.presentedViewController {
            return topVC(controller: presented)
        }
        
        return controller
        
    }
}
