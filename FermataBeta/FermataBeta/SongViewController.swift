//
//  ViewController.swift
//  FermataBeta
//
//  Created by Young Liu on 11/13/15.
//  Copyright © 2015 Young Liu. All rights reserved.
//

import UIKit

class SongViewController: UIViewController, UIWebViewDelegate {
    
    //Mark Properties
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewWillAppear(animated: Bool) {
        if let url = NSBundle.mainBundle().URLForResource("ReadMidiFile", withExtension: "html", subdirectory: "web"){
            let fragUrl = NSURL(string: "#FRAG_URL", relativeToURL: url)!
            let request = NSURLRequest(URL: fragUrl)
            webView.delegate = self
            webView.loadRequest(request)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

