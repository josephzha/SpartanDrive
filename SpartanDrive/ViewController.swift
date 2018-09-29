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

class ViewController: UIViewController, GIDSignInUIDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        //fb signin button
        let loginButton = LoginButton(readPermissions: [ .publicProfile,.email ])
        loginButton.center = view.center
        view.addSubview(loginButton)
        //google signin button
        GIDSignIn.sharedInstance().uiDelegate = self

        
    }


}

