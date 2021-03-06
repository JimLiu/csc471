//
//  DVRViewController.swift
//  MockRemoteControl
//
//  Created by LIUJUNMIN on 2/15/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit

class DVRViewController: UIViewController {
    
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var powerLabel: UILabel!
    
    var dvr = MyDVR()
    
    func displayConfirming() {
        let alertController = UIAlertController(title: "Confirming", message: "The current operation has been stopped and the requested operation proceeds.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: { action in
            
        }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func displayActionSheet(message: String, state: MyDVRState) {
        let alertController = UIAlertController(title: "Warning", message: message, preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Force", style: .Default) { (action) in
            self.dvr.state = state
            self.displayConfirming()
        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)

    }
    
    @IBAction func powerStatusChanged(sender: UISwitch) {
        dvr.on = sender.on
    }
    
    @IBAction func play(sender: UISwitch) {
        if dvr.state == MyDVRState.Recording {
            displayActionSheet("Your DVR is recording, would you like to force playing by stopping the current operation?", state: MyDVRState.Playing)
        } else {
            dvr.state = .Playing
        }
    }
    
    func pauseAndFastActions(state: MyDVRState) {
        if dvr.state != .Playing {
            displayActionSheet("Your DVR is not playing, would you like to force \(state.description) by stopping the current operation?", state: state)
        } else {
            dvr.state = state
        }
    }
    
    @IBAction func pause(sender: UISwitch) {
        pauseAndFastActions(MyDVRState.Paused)
    }
    
    @IBAction func fastForward(sender: UISwitch) {
        pauseAndFastActions(MyDVRState.FastForwarding)
    }
    
    @IBAction func fastRewind(sender: UISwitch) {
        pauseAndFastActions(MyDVRState.FastRewinding)
    }
    
    @IBAction func stop(sender: UISwitch) {
        dvr.state = MyDVRState.Stopped
    }
    
    @IBAction func record(sender: UISwitch) {
        if dvr.state != MyDVRState.Stopped {
            displayActionSheet("Your DVR is \(dvr.state.description), would you like to force recording by stopping the current operation?", state: MyDVRState.Recording)
        } else {
            dvr.state = .Recording
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dvr.switchChanged = {(on: Bool) in
            self.powerLabel.text = on ? "On" : "Off"
            // enable/disable all buttons
            for case let button as UIButton in self.view.subviews {
                button.enabled = on
            }
        }
        
        dvr.stateChanged = { (state: MyDVRState) in
            self.stateLabel.text = state.description
        }

    }
}