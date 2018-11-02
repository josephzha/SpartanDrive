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

class LoginViewController: UIViewController, GIDSignInUIDelegate {
  
    
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
            print("Google Sign In Success")
            self.performSegue(withIdentifier: "googleSegueIn", sender: nil)
        }
        
        // Google Logout Segue.
//        if (!GIDSignIn.sharedInstance().hasAuthInKeychain()) {
//            print("Google Sign Out Success")
//            self.performSegue(withIdentifier: "googleSegueOut", sender: nil)
//        }
        
        // Facebook Login Segue.
        
        // Facebook Logout Segue.
    }
    
    // Upload File.
    
    // Custom Google Sign In Button.
    @IBAction func googleSignIn(_ sender: UIButton) {
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }

    // Custom Facebook Sign In Button.
    @IBAction func facebookSignIn(_ sender: UIButton) {
        _ = LoginButton(readPermissions: [ .publicProfile,.email ])
    }
}
