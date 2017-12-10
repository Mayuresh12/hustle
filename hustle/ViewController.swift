//
//  ViewController.swift
//  hustle
//
//  Created by Mayuresh Rao on 12/4/17.
//  Copyright © 2017 Mayuresh Rao. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var darkBg: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var clouds: UIImageView!
    @IBOutlet weak var hustleMode: UILabel!
    @IBOutlet weak var on: UILabel!
    @IBOutlet weak var cloudHolder: UIView!
    var player :AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        powerBtn.isHidden = true
        darkBg.isHidden = true
        player.play()
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 240, width: 375, height: 160)
        }){
            (finished) in
            self.hustleMode.isHidden = false
            self.on.isHidden = false
        }
    }
}

