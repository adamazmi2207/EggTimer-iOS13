//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 60

    @IBOutlet weak var countDownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
    }

    @objc func update() {
        if(count > 0) {
            print("\(count) seconds to the end of the world")
            countDownLabel.text = String(count)
            count -= 1
//            countDownLabel.text = String(count--)
        }
    }
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness: String? = sender.currentTitle
        
       
        print(eggTimes[hardness!]!)
    }
}
