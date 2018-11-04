//
//  facebookViewController.swift
//  SpartanDrive
//
//  Created by Pierce Tu on 11/1/18.
//  Copyright © 2018 group11. All rights reserved.
//

import UIKit
import FacebookLogin
import Firebase
import GoogleSignIn

class facebookViewController: UIViewController {
    
    // Custom Facebook Sign Out Button. Go back to Login page.
    @IBAction func googleSignOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        print("Sign Out Success")
        self.dismiss(animated: true)
    }
}
