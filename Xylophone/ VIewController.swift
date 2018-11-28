//
//  ViewController.swift
//  Xylophone
//
//  Created by Cavit on 25.11.2018.
//  Copyright © 2018 Cavit KULAKLI. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func soundPlayWithId(noteId : Int){
        if let soundURL = Bundle.main.url(forResource: "note\(noteId)", withExtension: "wav") {
            
            do {
                
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL, fileTypeHint: AVFileType.wav.rawValue)
                
                guard let player = audioPlayer else { return }
                
                player.play()
                
            } catch let error {
                print(error)
            }
        }
    }
    
    
    @IBAction func notePressed(_ sender: UIButton) {
        
        soundPlayWithId(noteId: sender.tag)
        
    }
    
    
    
}

