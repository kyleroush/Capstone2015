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

class SongViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    //Mark Properties
    
    // @IBOutlet weak var songLabelTitle: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var songName: UILabel!
    var myWebView: WKWebView?
    
    
    //This value is either passed by `SongTableViewController` in `prepareForSegue(_:sender:)
    var song: Song?
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let param = "hello"
        webView.stringByEvaluatingJavaScriptFromString("myJSFunction('\(param)')")
        
        NSLog("request: \(request)")
        
        if let scheme = request.URL?.scheme {
            if scheme == "mike" {
                //now we can react
                
                NSLog("we got a mike request: \(scheme)")
                
                let param = "hello"
                webView.stringByEvaluatingJavaScriptFromString("myJSFunction('\(param)')")
                
                return false
            }
        }
        
        return true
    }
    
    override func viewDidLoad() {
        //super.viewDidLoad()
        
        
        // Set up views if editing an existing Meal.
        if let song = song {
            songName.text = song.name
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        //let urlDiff = "http://people.eecs.ku.edu/~kroush/MidiToVex/MidiToVex.html";
        if let url = NSURL (string: "http://people.eecs.ku.edu/~kroush/MidiToVex/MidiToVex.html")
        {
            let requestObj = NSURLRequest(URL: url)
            webView.loadRequest(requestObj)
        }
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

