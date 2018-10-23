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
    let image = UIImage (named: "spartan.png")
    var imageView : UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // spartan logo
        imageView = UIImageView(frame: CGRect(x: 163, y: 77, width: 53, height: 53))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        view.addSubview(imageView)
        
        //fb signin button
        let loginButton = LoginButton(readPermissions: [ .publicProfile,.email ])
        loginButton.center = view.center
        view.addSubview(loginButton)
    
        //google sign in
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
        print(GIDSignIn.sharedInstance()?.hasAuthInKeychain(), true ?? false)

        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            print("Sign In Success")
            performSegue(withIdentifier: "SignInSegue", sender: self)
        }
        else {
            print("Sign In Failure")
        }
    }
    
//    @IBAction func signInSegue(_ sender: Any) {
//        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
//            print("Sign In Success")
//            performSegue(withIdentifier: "SignInSegue", sender: self)
//            print("Segue Success")
//        }
//        else {
//            print("Sign In Failure")
//        }
//    }

    @IBAction func didTapSignOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        print("Sign Out Success")
    }
    
}

