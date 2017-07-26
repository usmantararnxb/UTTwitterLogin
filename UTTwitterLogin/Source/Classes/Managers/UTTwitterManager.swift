//
//  TwitterManager.swift
//  SocialLogin
//
//  Created by Usman Tarar on 18/07/2017.
//  Copyright © 2017 Usman Tarar. All rights reserved.
//

import UIKit
import TwitterKit


internal class UTTwitterManager: NSObject {
    
    
    func tryAuthenticateFrom(vc: UIViewController, success: SuccessBlock!,
                             failureBlock failure: FailureErrorBlock!) {
        self.loginWithTwitter(success: { (user) in
            
            success(user)
            
        }) { (error) in
            
            failure(error)
            
        }
    }
    
    
    func logout() {
        
        let store = Twitter.sharedInstance().sessionStore
        
        if let userID = store.session()?.userID {
            
            store.logOutUserID(userID)
            
        }
        
    }
}

extension UTTwitterManager {

    func loginWithTwitter(success: SuccessBlock!,
                          failureBlock failure: FailureErrorBlock!) {
        
        
        Twitter.sharedInstance().logIn { (session, error) in
            
            DispatchQueue.main.async{
                
                if error != nil {
                    
                    let error = NSError.init(errorMessage: error?.localizedDescription, code: unknownErrorCode)
                    failure(error)
                    
                }
                else {
                    
                    if (session != nil) {
                        
                        self.getTwitterUser(success: { (user) in
                            
                            user.socialID = session!.userID
                            user.name = session!.userName
                            user.authToken = session!.authToken
                            user.authTokenSecret = session!.authTokenSecret
                            success(user)
                            
                            
                        }, failureBlock: { (error) in
                            
                            failure(error)
                            
                        })
                        
                    } else {
                        
                        let error = NSError.init(errorMessage: error?.localizedDescription, code: unknownErrorCode)
                        failure(error)
                        
                    }
                    
                }
                
            }
            
        }
    }
    
    
    func getTwitterUser(success: SuccessBlock!, failureBlock failure: FailureErrorBlock!) {
        
        let client = TWTRAPIClient.withCurrentUser()
        let request = client.urlRequest(withMethod: "GET",
                                        url: "https://api.twitter.com/1.1/account/verify_credentials.json",
                                        parameters: ["include_email": "true", "skip_status": "true"],
                                        error: nil)
        
        
        client.sendTwitterRequest(request) { (response, data, connectionError) in

            
            if connectionError == nil {
                do{
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                  
                    
                    let user = UTSocialUser()
                    
                    if let firstName = json["name"] {
                        user.firstName = firstName as! String
                    }
                    
                    if let lastName = json["screen_name"] {
                        user.lastName = lastName as! String
                    }
                    
                    if let email = json["email"] {
                        user.email = email as! String
                    }
                    
                    if let profileImage = json["profile_image_url"] {
                        user.imageUrl = profileImage as! String
                    }
                    
                    success(user)
                    
                } catch {
                    
                }
            }
            else {
                
                let error = NSError.init(errorMessage: connectionError?.localizedDescription, code: unknownErrorCode)
                failure(error)
                
            }
            
        }
    }
    
}
