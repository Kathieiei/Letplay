//
//  SONGIController.swift
//  ios 13610329 week8 project1 xylophone
//
//  Created by thitiwan on 24/11/2562 BE.
//  Copyright © 2562 ictsilpakorn. All rights reserved.
//

import UIKit
import AVFoundation

class SONGIController: UIViewController ,
    AVAudioPlayerDelegate{
    
    
    
    var audioPlayer : AVAudioPlayer!
    
    
    var selectedSoundFile = ""
    
    let soundArray = ["Star"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func notePressed(_ sender: UIButton) {
        selectedSoundFile = soundArray[sender.tag-1]
        print(selectedSoundFile)
        playSound()
    }
    
    func playSound() {
        let soundURL = Bundle.main.url(forResource:selectedSoundFile , withExtension: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf:soundURL!)
            guard let audioPlayer = audioPlayer else {return}
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }catch let error as Error{
            print(error)
        }
    }
    
}//end class


