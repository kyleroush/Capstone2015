//
//  ViewController.swift
//  FermataBeta
//
//  Created by Young Liu on 1/28/16.
//  Copyright © 2016 Young Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var Menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Menu.target = self.revealViewController()
        
        Menu.action = Selector("revealToggle:")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
