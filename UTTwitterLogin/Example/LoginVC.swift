//
//  LoginVC.swift
//  UTSocialLogin
//
//  Created by Usman Tarar on 20/07/2017.
//  Copyright © 2017 Usman Tarar. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    fileprivate let socialManager = UTSocialManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func TwitterLoginTapped(_ sender: Any) {
        
        socialManager.loginWithTwitterFrom(vc: self, success: { (user) in
            
            print(user.email)
            
        }) { (error) in
            
            print((error?.userInfo[NSLocalizedDescriptionKey])!)
            
        }
        
    }
    
    @IBAction func TwitterLogoutTapped(_ sender: Any) {
        
        socialManager.logoutTwitterUser()
        
    }
}

