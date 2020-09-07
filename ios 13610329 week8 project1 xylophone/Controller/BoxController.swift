//
//  BoxController.swift
//  ios 13610329 week8 project1 xylophone
//
//  Created by thitiwan on 23/11/2562 BE.
//  Copyright © 2562 ictsilpakorn. All rights reserved.
//

import UIKit
import AVFoundation

class BoxController: UIViewController , AVAudioPlayerDelegate{
    var audioPlayer : AVAudioPlayer!
      
      
      var selectedSoundFile = ""
      
      let soundArray = ["do-box", "re-box" ,"mi-box" ,"fa-box" ,"sol-box" ,"la-box" ,"si-box" ,"doh-box"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func notePressed(_ sender: UIButton) {
        selectedSoundFile = soundArray[sender.tag-1]
        print(selectedSoundFile)
        playSound()
    }

  func playSound() {
         let soundURL = Bundle.main.url(forResource:selectedSoundFile , withExtension: "aiff")
         do{
             audioPlayer = try AVAudioPlayer(contentsOf:soundURL!)
             guard let audioPlayer = audioPlayer else {return}
             audioPlayer.prepareToPlay()
             audioPlayer.play()
         }catch let error as Error{
             print(error)
         }
     }

}
