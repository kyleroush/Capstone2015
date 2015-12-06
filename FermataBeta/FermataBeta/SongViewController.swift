//
//  ViewController.swift
//  FermataBeta
//
//  Created by Young Liu on 11/13/15.
//  Copyright © 2015 Young Liu. All rights reserved.
//

import UIKit
import JavaScriptCore

extension NSData {
    func hexString() -> NSString {
        var str = NSMutableString()
        let bytes = UnsafeBufferPointer<UInt8>(start: UnsafePointer(self.bytes), count:self.length)
        for byte in bytes {
            str.appendFormat("%02hhx", byte)
        }
        return str
    }
}

class SongViewController: UIViewController, UIWebViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Mark Properties
    
    // @IBOutlet weak var songLabelTitle: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var songName: UILabel!
    
    // let tableView = SongTableViewController.sharedInstance
    //var songLabel = String()
    
    
    //This value is either passed by `SongTableViewController` in `prepareForSegue(_:sender:)
    var song: Song?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up views if editing an existing Meal.
        if let song = song {
            songName.text = song.name
        }
        
        //to call the html/javascript stuff
        if let url = NSBundle.mainBundle().URLForResource("MidiToVex", withExtension: "html", subdirectory: "MidiToVex"){
            let fragUrl = NSURL(string: "#FRAG_URL", relativeToURL: url)!
            let request = NSURLRequest(URL: fragUrl)
            webView.delegate = self
            webView.loadRequest(request)
            
            var str = "http://people.eecs.ku.edu/~sbenson/grabMidi.php?title="
            str += song!.name
            
            print(str)
            
            if let url = NSURL(string: str) {
                do {
                    var data = NSData(contentsOfURL: url)
                    var stuff = data!.hexString() as String
                    //print(stuff)
                    
                    let my = NSBundle.mainBundle().URLForResource("hope", withExtension: "js", subdirectory: "midiToVex")!
                    let text = try! String(contentsOfURL: my, encoding: NSUTF8StringEncoding)
                    print(text)
                    
                    // create a javascript context environment and evaluate script
                    let context = JSContext()
                    context.evaluateScript(text)
                    
                    context.evaluateScript("var num = 5 +5")
                    let output: JSValue = context.evaluateScript("num")
                    print(output)
                    
                    // get reference to hello() function
                    let helloFunc = context.objectForKeyedSubscript("readMidiFile")
                    // execute hello() function with parameter
                    let a: JSValue = helloFunc.callWithArguments([stuff])
                    print(a)
                    
                } catch {
                    print("contents could not be loaded")
                }
            } else {
                print("Contents are bad!")
            }

            
        }
        
        //http://people.eecs.ku.edu/~sbenson/grabMidi.php?title=twelvedaysofchristmas
        
        //let home = NSHomeDirectory()
        // load javascript file in String
        //let jsSource = try? String(contentsOfFile: "/test.js", encoding: NSUTF8StringEncoding)
        
        //let path = NSBundle.mainBundle().pathForResource("test", ofType: "js")
        //let data = try? NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        //let fileContent = try? NSString(contentsOfFile: loc, encoding: NSUTF8StringEncoding)
        
        //let my = NSBundle.mainBundle().URLForResource("JZZ.Midi", withExtension: "js", subdirectory: "midiToVex")!
        //let text = try! String(contentsOfURL: my, encoding: NSUTF8StringEncoding)
        //print(text)
        
        //print(fileContent)
        
        // create a javascript context environment and evaluate script
        let context = JSContext()
        //context.evaluateScript(text)
        
        //context.evaluateScript("var num = 5 +5")
        //let output: JSValue = context.evaluateScript("num")
        //print(output)
        
        // get reference to hello() function
        let helloFunc = context.objectForKeyedSubscript("readMidiFile")
        // execute hello() function with parameter
        let helloValue = helloFunc.callWithArguments([""])
        
        // get reference to hola() function
        //let holaFunc = context.objectForKeyedSubscript("hola")
        // execute hola() function with parameter
        //let holaValue = holaFunc.callWithArguments(["Bobby"])
        
        //all these didn't work
        /*  NSUTF16LittleEndianStringEncoding
            NSUTF16StringEncoding 
            NSUTF32BigEndianStringEncoding 
            NSUTF32LittleEndianStringEncodings
            NSUTF32StringEncoding NSUTF8StringEncoding */
   
       //let some = NSBundle.mainBundle().URLForResource("yes_notes4", withExtension: "mid", subdirectory: "midiToVex")! //
        //var contents:NSURL =
      //  print(midiFile)
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
       /* let jsPath = NSBundle.mainBundle().URLForResource("JZZ.Midi", withExtension: ", subdirectory: <#T##String?#>)("JZZ.Midi", ofType: "js")
        let jsContent = NSString(contentsOfFile: jsPath!, encoding: NSUTF8StringEncoding, error: nil) as! String
        
        webView.stringByEvaluatingJavaScriptFromString(jsContent)*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

