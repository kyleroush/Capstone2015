//
//  Tuner.swift
//  FermataBeta
//
//  Created by Young Liu on 1/30/16.
//  Copyright © 2016 Young Liu. All rights reserved.
//

//Eric and Sam: work on this file

//ALL the free notes come from this page

import Foundation
import AVFoundation

class Tuner: UIViewController {
   
    var audioPlayer = AVAudioPlayer()
    
    var noteList = [String]()
    

    
    
    @IBAction func play(sender: AnyObject) {
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
    }
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteList = ["0A", "10G", "11Gs", "1As", "2B", "3C", "4Cs", "5D", "6Ds","7E","8F","9Fs"]
        
        let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("0A", ofType: "wav")!)
        print(alertSound)
        
        // Removed deprecated use of AVAudioSessionDelegate protocol
        //var errors:NSError?
        do
        {
            
        try audioPlayer = AVAudioPlayer(contentsOfURL: alertSound)
        }
        catch _ { }
        
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}