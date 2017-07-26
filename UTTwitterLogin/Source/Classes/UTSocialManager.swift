//
//  SocialManager.swift
//  SocialLogin
//
//  Created by Usman Tarar on 14/07/2017.
//  Copyright © 2017 Usman Tarar. All rights reserved.
//

import UIKit
import TwitterKit


/// Success block with custom UTSocialUser parameter for UISocialManager
public typealias SuccessBlock = (_ result: UTSocialUser) -> Void

/// Failure block with NSError parameter for UISocialManager
public typealias FailureErrorBlock = (_ error: NSError?) -> Void



/// UTSocialManager: Make a instance of this class to call desired login methods
public class UTSocialManager: NSObject {
    

    
    
    
    
    //MARK:- TwitterManagerMethods
    
    func loginWithTwitterFrom(vc: UIViewController, success: SuccessBlock!, failureBlock failure: FailureErrorBlock!) {
        
        let utTwitterManager = UTTwitterManager()
        
        utTwitterManager.tryAuthenticateFrom(vc: vc, success: { (user) in
            
            success(user)
            
        }) { (error) in
            
            failure(error)
            
        }
        
    }
    
    func logoutTwitterUser() {
        
        let utTwitterManager = UTTwitterManager()
        utTwitterManager.logout()
        
    }
    
}


extension UTSocialManager {

    /// Twitter SharedInstance
    class func twitterSharedInstanceDelegate(withConsumerKey: String, andConsumerSecret: String) {
        
        Twitter.sharedInstance().start(withConsumerKey:withConsumerKey, consumerSecret:andConsumerSecret)
        
    }

}


