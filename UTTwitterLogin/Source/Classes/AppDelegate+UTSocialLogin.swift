//
//  AppDelegate+UTSocialLogin.swift
//  SocialLogin
//
//  Created by Usman Tarar on 20/07/2017.
//  Copyright © 2017 Usman Tarar. All rights reserved.
//

import Foundation
import TwitterKit

//MARK: - AppDelegate

extension AppDelegate {
    
    //Overide this methods for coming back to app after login
    public func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        
        if Twitter.sharedInstance().application(app, open: url, options: options) {
            return true
        }
        // If you handle other (non Twitter Kit) URLs elsewhere in your app, return true. Otherwise
        return false
    }
    
    

}
