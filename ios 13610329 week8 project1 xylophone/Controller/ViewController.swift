//
//  ViewController.swift
//  ios 13610329 week8 project1 xylophone
//
//  Created by ICT-MAC on 28/9/2562 BE.
//  Copyright © 2562 ictsilpakorn. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,
    AVAudioPlayerDelegate{
    
    
    
    var audioPlayer : AVAudioPlayer!
    
    
    var selectedSoundFile = ""
    
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

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
        let soundURL = Bundle.main.url(forResource:selectedSoundFile , withExtension: "wav")
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

