//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Najim Mazidi on 10/07/2016.
//  Copyright © 2016 Najim Mazidi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
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
    }

    @IBAction func StopRecording(sender: AnyObject) {
        print("Stop Recording button pressed")

    }
}

