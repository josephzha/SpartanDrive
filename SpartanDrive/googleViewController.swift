//
//  googleViewController.swift
//  SpartanDrive
//
//  Created by Pierce Tu on 11/1/18.
//  Copyright © 2018 group11. All rights reserved.
//

import UIKit
import FacebookLogin
import Firebase
import GoogleSignIn

class googleViewController: UIViewController, GIDSignInUIDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
         //Google Logout Segue.
                if (GIDSignIn.sharedInstance().hasAuthInKeychain() == false) {
                    print("Google Sign Out Success")
                    performSegue(withIdentifier: "googleSegueOut", sender: nil)
                }
        
        // Facebook Login Segue.
        
        // Facebook Logout Segue.
    }
    
    // Custom Google Sign Out Button.
    @IBAction func googleSignOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        self.dismiss(animated: true)
    }
}







