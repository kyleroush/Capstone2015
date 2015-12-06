//
//  SongTableViewController.swift
//  FermataBeta
//
//  Created by Young Liu on 11/16/15.
//  Copyright © 2015 Young Liu. All rights reserved.
//

import UIKit
import JavaScriptCore
import WebKit

class SongTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var songs = [Song]()
    //let songList: [String] = ["Fur Elise", "Moonlight Sonata", "Beethoven's Fifth Symphony"]
    
    class var sharedInstance: SongTableViewController {
        struct Static {
            static var instance: SongTableViewController?
            static var token: dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = SongTableViewController()
        }
        
        return Static.instance!
    }
    
    func loadSampleSongs(){
        
        let contents: NSString = ""
        if let url = NSURL(string: "http://people.eecs.ku.edu/~sbenson/grabTitles.php") {
            do {
                let contents = try NSString(contentsOfURL: url, usedEncoding: nil)
                print(contents)
                let newContent = contents as! String
                print("new contents:" + newContent)
                
                let contentArr = newContent.characters.split{$0 == " "}.map(String.init)
                
                print(contentArr)
                
                for item in contentArr {
                    songs += [Song(name: item)]
                }
                
            } catch {
                print("contents could not be loaded")
            }
        } else {
            // the URL was bad!
        }
        print(contents)
        
        //print("new content: " + newContent)
        
        
       /* let fullName = "First Last"
        let fullNameArr = fullName.characters.split{$0 == " "}.map(String.init)
        
        print(fullNameArr[1])*/
        
        
        
      

        
       /* for item in songList {
            songs += [Song(name: item)]
        }*/
 
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            let songDetailViewController = segue.destinationViewController as! SongViewController
            
            // Get the cell that generated this segue.
            if let selectedSongCell = sender as? SongTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedSongCell)!
                let selectedSong = songs[indexPath.row]
                songDetailViewController.song = selectedSong
            }
        }
    }

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
}
