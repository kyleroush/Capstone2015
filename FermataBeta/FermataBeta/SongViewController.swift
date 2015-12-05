//
//  ViewController.swift
//  FermataBeta
//
//  Created by Young Liu on 11/13/15.
//  Copyright © 2015 Young Liu. All rights reserved.
//

import UIKit

class SongViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Mark Properties
    
   // @IBOutlet weak var songLabelTitle: UILabel!
    @IBOutlet weak var webView: UIWebView!
    
   // let tableView = SongTableViewController.sharedInstance
    
    //var songLabel = String()
    
    
    //This value is either passed by `SongTableViewController` in `prepareForSegue(_:sender:)
    
    var song: Song?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = song!.name
        
        if let url = NSBundle.mainBundle().URLForResource("ReadMidiFile", withExtension: "html", subdirectory: "web"){
            let fragUrl = NSURL(string: "#FRAG_URL", relativeToURL: url)!
            let request = NSURLRequest(URL: fragUrl)
            webView.delegate = self
            webView.loadRequest(request)
            //
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

