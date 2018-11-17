//
//  ViewController.swift
//  SpartanDrive
//
//  Created by Yilin Zhao on 9/26/18.
//  Copyright © 2018 group11. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate {
  
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.uiDelegate = self
        
    }
    

    
    // Custom Google Sign In Button.
    @IBAction func googleSignIn(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }

    // Custom Facebook Sign In Button.
    @IBAction func facebookSignIn(_ sender: UIButton) {
        FBSDKLoginManager().logIn(withReadPermissions: ["email","public_profile"], from: self) { (result,error) in
            if error != nil{
                print("error with logging in fb:",error)
                return
            }
            print("successfully logged in fb:",result?.token.tokenString)
            // authenticate on firebase using fb token
            let accessToken = FBSDKAccessToken.current()
            guard let accessTokenString = accessToken?.tokenString else{return }
            let credential = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
            Auth.auth().signInAndRetrieveData(with: credential) { (user, err) in
                if err != nil{
                    print("something wrong with FB user: ",err ?? "")
                    return
                }
                print("successfully authenticated in with fb user: ",user ?? "")
                self.performSegue(withIdentifier:"mainPageSegueIn" , sender: nil)
                
            }
    }
    
    // Login with registered account information button.
    
}
    @IBAction func emaillogin(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        Auth.auth().signIn(withEmail: email ?? "", password: password ?? "") { (result, error) in
            if error != nil{
                print("error during logging in with email",error)
            }
            print("successfully logged in with email")
            self.performSegue(withIdentifier:"mainPageSegueIn" , sender: nil)
        }
    }
    @IBAction func emailsignup(_ sender: UIButton) {
        let email = emailTextField.text
        let password = passwordTextField.text
        Auth.auth().createUser(withEmail: email ?? "", password: password ?? "") { (result, error) in
            if error != nil{
                print("error during creating user with email",error)
            }
            guard let user = result?.user else { return }
        }
    }
}
