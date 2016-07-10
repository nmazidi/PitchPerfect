//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Najim Mazidi on 10/07/2016.
//  Copyright © 2016 Najim Mazidi. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController , AVAudioRecorderDelegate {
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var RecordButton: UIButton!
    @IBOutlet weak var StopRecordingButton: UIButton!
    
    var AudioRecorder:AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func RecordAudio(sender: AnyObject) {
        print("Record button pressed")
        recordingLabel.text = "Recording in Progress..."
        RecordButton.enabled = false
        StopRecordingButton.enabled = true
        
        let DirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        
        let RecordingName = "recordedVoice.wav"
        let pathArray = [DirPath, RecordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! AudioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        AudioRecorder.delegate = self
        AudioRecorder.meteringEnabled = true
        AudioRecorder.prepareToRecord()
        AudioRecorder.record()
    }

    @IBAction func StopRecording(sender: AnyObject) {
        print("Stop Recording button pressed")
        StopRecordingButton.enabled = false
        RecordButton.enabled = true
        recordingLabel.text = "Tap to Record"
        AudioRecorder.stop()
        let AudioSession = AVAudioSession.sharedInstance()
        try! AudioSession.setActive(false)
        

    }
    
    override func viewWillAppear(animated: Bool) {
        print("View will appear called")
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("recording finished")
        if (flag) {
            self.performSegueWithIdentifier("stopRecording", sender: AudioRecorder.url)
            print("test")
        } else {
            print("Saving of recording failed")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
            
        }
    }
    
}

