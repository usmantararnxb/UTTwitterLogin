//
//  NSError+UTSocialLogin.swift
//  SocialLogin
//
//  Created by Usman Tarar on 20/07/2017.
//  Copyright © 2017 Usman Tarar. All rights reserved.
//

import Foundation

//MARK: - NSError

let appDomain = "com.appdev360.SocialLogin"
let generalAppError = "Something went wrong."
let unknownErrorCode = -1

public extension NSError {
    
    
    public convenience init(errorMessage:String?, code: Int? = nil) {
        
        var errorMessage = errorMessage
        
        if errorMessage == nil {
            errorMessage = generalAppError
        }
        
        var errorCode = -1
        if let code = code { errorCode = code}
        
        self.init(domain: appDomain, code: errorCode, userInfo: [NSLocalizedDescriptionKey: errorMessage!])
    }
    
}
