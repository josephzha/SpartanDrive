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
    
    @IBOutlet weak var uploadImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    let filename = "earth.jpg"
    
    // Image Reference creates folder named "images" in Firebase Storage.
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    
    // Upload Button
    @IBAction func uploadTapped(_ sender: UIButton) {
        guard let image = uploadImage.image else { return  }
        guard let imageData = image.jpegData(compressionQuality: 1) else { return }
        
        let uploadImageRef = imageReference.child(filename)
        
        let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            print("UPLOAD COMPLETE")
            print(metadata ?? "NO METADATA")
            print(error ?? "NO ERROR")
        }
        
        uploadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "NO MORE PROGRESS")
        }
        
        uploadTask.resume() 
    }
    
    // Custom Google Sign Out Button. Go back to Login page.
    @IBAction func googleSignOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        print("Sign Out Success")
        self.dismiss(animated: true)
    }
}







