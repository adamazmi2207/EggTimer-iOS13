//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    var totalTime: Float = 0.0
    var secondsPassed: Float = 0.0
    var secondsRemaining = 0

    @IBOutlet weak var countDownLabel: UILabel!
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    let eggTimes: [String: Float] = ["Soft": 300.0, "Medium": 420.0, "Hard": 700.0]
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness: String? = sender.currentTitle
        let eggTime: Float = eggTimes[hardness!]!

        topTitle.text = hardness
        progressBar.progress = 0.0
        timer.invalidate()
       
        totalTime = eggTime
        secondsRemaining = Int(eggTime)
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
    }
    
    func playSound(soundTitle: String) {
            let url = Bundle.main.url(forResource: soundTitle, withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }
    
    @objc func update() {
        if(secondsPassed < totalTime){
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed / totalTime)
            print("secondsPassed -> \(secondsPassed)")
            print("totalTime -> \(totalTime)")
            print("percentageProgress -> \(percentageProgress)")
            print("//////////////////////////")
            progressBar.progress = Float(percentageProgress)
        }else if(secondsPassed == totalTime){
            playSound(soundTitle: "alarm_sound")
            topTitle.text = "DONE!"
            timer.invalidate()
            secondsPassed = 0
        }
        if(secondsRemaining >= 0) {
            print("\(secondsRemaining) seconds left")
            countDownLabel.text = String(secondsRemaining)
            secondsRemaining -= 1
        }
    }
    
    
}
