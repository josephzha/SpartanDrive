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
import FirebaseStorage

class googleViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, GIDSignInUIDelegate {
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var uploadProgressBar: UIProgressView!
    @IBOutlet weak var uploadProgressLabel: UILabel!
    //let your_firebase_storage_bucket = FirebaseOptions.defaultOptions()?.storageBucket ?? ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.uploadProgressBar.progress = 0.0
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
            // ERROR MESSAGE
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // Moving Progress Bar Look.
    //    @objc func movingProgressBar() {
    //
    //        var recievedData : Float
    //        var expectedTotalSize : Float
    //        var actual : Float = uploadProgressBar.progress
    //        if (actual < 1) {
    //            uploadProgressBar.progress = actual + (recievedData/expectedTotalSize)
    //            Timer.scheduledTimer(timeInterval: 0.05, invocation: self, repeats: false)
    //        }
    //    }
    //
    // Upload Progress Conversion.
    //    private func URLSession(session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64)
    //    {
    //        print("didSendBodyData")
    //        let uploadProgress:Float = Float(totalBytesSent) / Float(totalBytesExpectedToSend)
    //        uploadProgressBar.progress = uploadProgress
    //        let progressPercent = Int(uploadProgress*100)
    //        uploadProgressLabel.text = "\(progressPercent)%"
    //        print(uploadProgress)
    //    }
    
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
        
        uploadTask.observe(.progress) { (snapshot) in
            print(snapshot.progress ?? "NO MORE PROGRESS")
        }
        
        uploadTask.resume()
        
        //        uploadProgressBar.setProgress(uploadTask.progress, animated: true)
    }
    
    // Custom Google Sign Out Button. Go back to Login page.
    @IBAction func googleSignOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        print("Sign Out Success")
        self.dismiss(animated: true)
    }
    
    
}







