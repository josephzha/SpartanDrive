//
//  FoldersViewController.swift
//  SpartanDrive
//
//  Created by Maryam Mostafavi on 11/25/18.
//  Copyright © 2018 group11. All rights reserved.
//

import UIKit

class FoldersViewController: UIViewController, NSObject {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func createFolder(withName theFolders: NSString?)  {
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
        let folder = URL(fileURLWithPath: documentsDirectory ?? "").appendingPathComponent(theFolders).absoluteString
        var isDir = false
        let fileManager = FileManager()
        if !fileManager.fileExists(atPath: folder, isDirectory: &isDir) && isDir == false {
            try? fileManager.createDirectory(atPath: folder, withIntermediateDirectories: false, attributes: nil)
        }
    }
   

}
