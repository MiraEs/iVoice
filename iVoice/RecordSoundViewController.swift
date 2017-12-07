//
//  RecordSoundViewController.swift
//  iVoice
//
//  Created by Mira Estil on 12/6/17.
//  Copyright © 2017 Mira Estil. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController {
    
    let segueId = "stopRecording"
    
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
    
    private var audioRecorder: AVAudioRecorder!
    
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
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath!)
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        recordingLabel.text = "Tap to Record"
        stopRecordingButton.isEnabled = false
        recordButton.isEnabled = true
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
 
    // MARK: SEGUES
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueId {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }

}

extension RecordSoundViewController: AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: segueId, sender: audioRecorder.url)
        } else {
            print("Recording failed")
        }
    }
}

