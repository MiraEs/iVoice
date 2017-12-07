//
//  ViewController.swift
//  iVoice
//
//  Created by Mira Estil on 12/6/17.
//  Copyright © 2017 Mira Estil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton! {
        didSet {
            recordButton.isEnabled = true
        }
    }
    
    @IBOutlet weak var stopRecordingButton: UIButton! {
        didSet {
            stopRecordingButton.isEnabled = false
        }
    }
    
    @IBOutlet weak var recordingLabel: UILabel! {
        didSet {
            recordingLabel.text = "Tap to Record"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: UTILITIES
    @IBAction func recordAudio(_ sender: UIButton) {
        recordingLabel.text = "Recording.."
        recordButton.isEnabled = false
        stopRecordingButton.isEnabled = true
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        recordingLabel.text = "Tap to Record"
        stopRecordingButton.isEnabled = false
        recordButton.isEnabled = true
    }
}

