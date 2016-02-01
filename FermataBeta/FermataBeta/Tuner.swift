//
//  Tuner.swift
//  FermataBeta
//
//  Created by Young Liu on 1/30/16.
//  Copyright © 2016 Young Liu. All rights reserved.
//

//Eric and Sam: work on this file

import Foundation
import AVFoundation

class Tuner: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    
    //we want the 4s
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Piano.mf.C1", ofType: "wav")!)
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
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}