//
//  TableTableViewController.swift
//  SpartanDrive
//
//  Created by Maryam Mostafavi on 11/25/18.
//  Copyright © 2018 group11. All rights reserved.
//

import UIKit

class TableTableViewController: UITableViewController {
    let titleObjectArray: NSArray
    let subtitleObjectArray : NSArray
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let counter = 0
        self.titleObjectArray = [counter++]
                                [counter++]
                                [counter++]
                                [counter++]
        self.subtitleObjectArray = [homeViewController().selectedImage]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableViewCell, numberOfRowsInSection section: Int) -> Int {
       
        return self.titleObjectArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: NSIndexPath) -> UITableViewCell {
        NSString CellIdetifier = "Cell"
        
    }
    
   
}
