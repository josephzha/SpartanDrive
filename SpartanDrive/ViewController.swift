//
//  ViewController.swift
//  SpartanDrive
//
//  Created by Yilin Zhao on 9/26/18.
//  Copyright © 2018 group11. All rights reserved.
//

import UIKit
import FacebookLogin
import Firebase
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {
    var imageView : UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        //fb signin button
//        let loginButton = LoginButton(readPermissions: [ .publicProfile,.email ])
//        loginButton.center = view.center
//        view.addSubview(loginButton)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        // Google Login Segue.
        if (GIDSignIn.sharedInstance().hasAuthInKeychain()) {
            print("Sign In Success")
            self.performSegue(withIdentifier: "googleSegueIn", sender: nil)
        }
        
        // Google Logout Segue.
        if (!GIDSignIn.sharedInstance().hasAuthInKeychain()) {
            print("Sign Out Success")
            self.performSegue(withIdentifier: "googleSegueOut", sender: nil)
        }
        
        // Facebook Login Segue.
        
        // Facebook Logout Segue.
    }
    
    // Custom Google Sign In Button.
    @IBAction func googleSignIn(_ sender: UIButton) {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    // Custom Google Sign Out Button.
    @IBAction func googleSignOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
    }

    // Custom Facebook Sign In Button.
    @IBAction func facebookSignIn(_ sender: UIButton) {
        _ = LoginButton(readPermissions: [ .publicProfile,.email ])
    }
    
    // Custom Facebook Sign Out Button.
    
}







