//
//  SocialUser.swift
//  SocialLogin
//
//  Created by Usman Tarar on 14/07/2017.
//  Copyright © 2017 Usman Tarar. All rights reserved.
//

import UIKit


/// Custom UTSocialUser model for containing data from desired login manager etc, FB, Tw, G+

public class UTSocialUser: NSObject {

    var socialID: String = ""
    var authToken: String = ""
    ///authTokenSecret is for twitter only
    var authTokenSecret: String = ""
    var name: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var imageUrl: String = ""
    
    override init() {
        super.init()
    }
}
	
