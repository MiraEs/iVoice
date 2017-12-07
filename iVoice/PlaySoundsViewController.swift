//
//  PlaySoundsViewController.swift
//  iVoice
//
//  Created by Mira Estil on 12/6/17.
//  Copyright © 2017 Mira Estil. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: URL!
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: Action
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("play sound")
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        print("stop button")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
