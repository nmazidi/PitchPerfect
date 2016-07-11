//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Najim Mazidi on 10/07/2016.
//  Copyright © 2016 Najim Mazidi. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!

    @IBOutlet weak var darthVaderButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int {
        case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb
    }
    
    @IBAction func playSoundForButton(sender: UIButton){
        print("play sound button pressed")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case.Reverb:
            playSound(reverb: true)
        }
        configureUI(.Playing)
    }
    @IBAction func stopButtonPressed(sender: UIButton){
        print("stop button pressed")
        stopAudio()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        let session = AVAudioSession.sharedInstance()
        let speaker = AVAudioSessionPortOverride.Speaker
        try! session.overrideOutputAudioPort(speaker)
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

}
