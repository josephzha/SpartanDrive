//
//  MainPageViewController.swift
//  SpartanDrive
//
//  Created by Maryam Mostafavi on 11/4/18.
//  Copyright © 2018 group11. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MainPageViewController: UIViewController {

    @IBOutlet weak var theImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onUploadTapped(_ sender: Any) {
    }
    
    @IBAction func onSelectTapped(_ sender: Any) {
    }
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }
    
}
