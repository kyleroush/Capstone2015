//
//  SongTableViewController.swift
//  FermataBeta
//
//  Created by Young Liu on 11/16/15.
//  Copyright © 2015 Young Liu. All rights reserved.
//

import UIKit
import JavaScriptCore

class SongTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var songs = [Song]()
    func loadSampleSongs(){
        let songList: [String] = ["Fur Elise", "Moonlight Sonata", "Beethoven's Fifth Symphony"]
        
        for item in songList {
            songs += [Song(name: item)]
        }
        
        //let home = NSHomeDirectory()
        // load javascript file in String
        //let jsSource = try? String(contentsOfFile: "/test.js", encoding: NSUTF8StringEncoding)
        
        //let path = NSBundle.mainBundle().pathForResource("test", ofType: "js")
        //let data = try? NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
        //let fileContent = try? NSString(contentsOfFile: loc, encoding: NSUTF8StringEncoding)
        
        let my = NSBundle.mainBundle().URLForResource("test", withExtension: "js")!
        let text = try! String(contentsOfURL: my, encoding: NSUTF8StringEncoding)
        print(text)
        
        //print(fileContent)
        
        // create a javascript context environment and evaluate script
        let context = JSContext()
        context.evaluateScript(text)
        
        context.evaluateScript("var num = 5 +5")
        let output: JSValue = context.evaluateScript("num")
        print(output)
        
        // get reference to hello() function
        let helloFunc = context.objectForKeyedSubscript("hello")
        // execute hello() function with parameter
        let helloValue = helloFunc.callWithArguments(["World!!!"])
        
        // get reference to hola() function
        let holaFunc = context.objectForKeyedSubscript("hola")
        // execute hola() function with parameter
        let holaValue = holaFunc.callWithArguments(["Bobby"])
        
        print(helloValue) // print "Hello World!!!"
        print(holaValue)  // print "Hola Bobby Cómo estás?"*/
        
        
 
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleSongs()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "SongTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SongTableViewCell
        
        let song = songs[indexPath.row]
        
        cell.nameLabel.text = song.name

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
