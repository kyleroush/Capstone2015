//
//  Tuner.swift
//  FermataBeta
//
//  Created by Young Liu and Eric on 1/30/16.
//  Copyright © 2016 Young Liu. All rights reserved.
//

//ALL the free notes come from this page

import Foundation
import AVFoundation

class Tuner: UIViewController {
   
    var audioPlayer = AVAudioPlayer()
    var count = 0
    
    var noteList = [String]()
    
    @IBAction func UpButton(sender: AnyObject) {
        if count == noteList.count-1 {
            count = 0
        }
        else {
           count++
        }
        print(count)
        Note.text = noteList[count]
    }
    
    @IBAction func DownButton(sender: AnyObject) {
        if count == 0{
            count=noteList.count-1
        }
        else {
            count--
        }
        print(count)
        Note.text = noteList[count]
    }
    
    @IBOutlet var Note: UILabel!
    //play button: plays sound
    @IBAction func play(sender: AnyObject) {
        let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(noteList[count], ofType: "wav")!)
        print(alertSound)
        
        // Removed deprecated use of AVAudioSessionDelegate protocol
        //var errors:NSError?
        do
        {
            
            try audioPlayer = AVAudioPlayer(contentsOfURL: alertSound)
        }
        catch _ { }
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        print(count)
        
    }
    

    //stops the music
    @IBAction func stopButton(sender: AnyObject) {
        audioPlayer.stop()
    }
    
    @IBOutlet var NotePlayed: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteList = ["0A", "10G", "11Gs", "1As", "2B", "3C", "4Cs", "5D", "6Ds","7E","8F","9Fs"]
        
        Note.text = noteList[count]
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}