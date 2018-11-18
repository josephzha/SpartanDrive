//
//  homeViewController.swift
//  SpartanDrive
//
//  Created by Yilin Zhao on 11/16/18.
//  Copyright © 2018 group11. All rights reserved.
//

import UIKit
import FacebookLogin
import Firebase
import GoogleSignIn
import FirebaseStorage

class homeViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, GIDSignInUIDelegate {
    
//    @IBOutlet weak var selectedImage: UIImageView!
//    @IBOutlet weak var uploadProgressBar: UIProgressView!
//    @IBOutlet weak var uploadProgressLabel: UILabel!
    //let your_firebase_storage_bucket = FirebaseOptions.defaultOptions()?.storageBucket ?? ""
    
    
    @IBOutlet weak var uploadProgressLabel: UILabel!
    @IBOutlet weak var selectedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Unique name for image file uploaded.
    let filename : String = "\(NSUUID().uuidString).jpg"
    
    // Image Reference creates folder named "images" in Firebase Storage.
    var imageReference: StorageReference {
        return Storage.storage().reference().child("images")
    }
    
    // Select Image from Photos.
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage.image = image
        }
        else {
            print("Error selecting an image")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // Select Image from Device.
    @IBAction func selectTapped(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true) {
            // After Completed.
        }
    }
    
    // Upload Button
    @IBAction func uploadTapped(_ sender: UIButton) {
        guard let image = selectedImage.image else { return  }
        guard let imageData = image.jpegData(compressionQuality: 1) else { return }
        
        let uploadImageRef = imageReference.child(filename)
        
        let uploadTask = uploadImageRef.putData(imageData, metadata: nil) { (metadata, error) in
            print("UPLOAD COMPLETE")
            print(metadata ?? "NO METADATA")
            print(error ?? "NO ERROR")
        }
        
        // UILabel for Upload in Progress.
        uploadTask.observe(.progress) { (snapshot) in
            self.uploadProgressLabel.text = ("Uploading...")
        }
        
        // UILabel for Upload Complete.
        uploadTask.observe(.success) { (snapshot) in
            self.uploadProgressLabel.text = ("Upload Complete")
            print(snapshot.progress ?? "Upload Complete")
        }
        
        uploadTask.resume()
    }
    
    // Custom Google Sign Out Button. Go back to Login page.
    @IBAction func SignOutTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "backtologin", sender: nil)
    }
    
    
    
}
