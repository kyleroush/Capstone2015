//
//  ViewController.swift
//  FermataBeta
//
//  Created by Young Liu on 11/13/15.
//  Copyright © 2015 Young Liu. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class SongViewController: UIViewController, UIWebViewDelegate {
    
    //Mark Properties
    
    // @IBOutlet weak var songLabelTitle: UILabel!
    @IBOutlet weak var webView: UIWebView!
    var myWebView: WKWebView?
    
    //This value is either passed by `SongTableViewController` in `prepareForSegue(_:sender:)
    var song: Song?
    
    override func viewWillAppear(animated: Bool) {
        webView.stringByEvaluatingJavaScriptFromString("thisIsDumb()")
    }
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        
        // Set up views if editing an existing Meal.
        /*if let song = song {
            songName.text = song.name
        }*/
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // goes to different songs now (hopefully)
        let webString = "http://people.eecs.ku.edu/~kroush/MidiToVex/MidiToVex.html?song=" + song!.name
        if let url = NSURL (string: webString)
        {
            let requestObj = NSURLRequest(URL: url)
            webView.loadRequest(requestObj)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

