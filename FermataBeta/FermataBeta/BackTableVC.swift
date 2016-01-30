//
//  BackTableVC.swift
//  FermataBeta
//
//  Created by Young Liu on 1/29/16.
//  Copyright © 2016 Young Liu. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController {
    
    var MenuItems = [String]()
    
    override func viewDidLoad() {
            MenuItems = ["Recent", "Music", "Smart Features"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MenuItems.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let block = tableView.dequeueReusableCellWithIdentifier("block", forIndexPath: indexPath) as UITableViewCell
    
        block.textLabel?.text = MenuItems[indexPath.row]
        
        return block
    }
    
    

}