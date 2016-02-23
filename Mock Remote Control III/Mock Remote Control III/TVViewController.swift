//
//  FirstViewController.swift
//  Mock Remote Control III
//
//  Created by LIUJUNMIN on 2/22/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit

class TVViewController: UIViewController {
    
    @IBOutlet private weak var chanelLabel: UILabel!
    @IBOutlet private weak var volumeLabel: UILabel!
    @IBOutlet private weak var powerLabel: UILabel!
    @IBOutlet private weak var chanelsPanel: UIView!
    @IBOutlet private weak var volumeSlider: UISlider!
    @IBOutlet private weak var powerSwitch: UISwitch!
    @IBOutlet private weak var favoritesSegmented: UISegmentedControl!
    
    
    var tv: TV!
    
    @IBAction func powerStatusChanged(sender: UISwitch) {
        tv.on = sender.on
    }
    
    @IBAction func chanelNumberTouched(sender: UIButton) {
        if let number = Int(sender.currentTitle!) {
            tv.changeChanel(number)
        }
    }
    
    @IBAction func plusChanel(sender: UIButton) {
        tv.increaseChanel()
    }
    
    @IBAction func volumeChanged(sender: UISlider) {
        tv.volume = Int(sender.value)
    }
    
    @IBAction func minusChanel(sender: UIButton) {
        tv.decreaseChanel()
    }
    
    @IBAction func favoritesSegmentedChanged(sender: UISegmentedControl) {
        let favorite = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        tv.favoriteChanels.forEach { (id, chanel) -> () in
            if favorite == chanel.name {
                tv.chanel = chanel.number
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.favoritesSegmented.removeAllSegments();
        tv.favoriteChanels.forEach { (id, chanel) -> () in
            self.favoritesSegmented.insertSegmentWithTitle(chanel.name, atIndex: 0, animated: false)
        }
        
        tv.switchChanged = {(on: Bool) in
            self.powerLabel.text = on ? "On" : "Off"
            self.favoritesSegmented.enabled = on
            self.volumeSlider.enabled = on
            // enable/disable all buttons
            for case let button as UIButton in self.chanelsPanel.subviews {
                button.enabled = on
            }
        }
        
        tv.chanelChanged = {(number: Int) in
            // check if current favorite chanel selected
            // if current chanel is one of the favorite chanels
            // then select it
            
            var favorite: Chanel? = nil
            self.tv.favoriteChanels.forEach({ (id, chanel) -> () in
                if (chanel.number == number) {
                    favorite = chanel
                }
            })
            
            if let _ = favorite {
                for i in (0...self.favoritesSegmented.numberOfSegments-1) {
                    if favorite!.name == self.favoritesSegmented.titleForSegmentAtIndex(i) {
                        self.favoritesSegmented.selectedSegmentIndex = i
                        break
                    }
                }
            } else {
                self.favoritesSegmented.selectedSegmentIndex = UISegmentedControlNoSegment;
            }
        }
        
        tv.chanelDisplayChanged = {(chanelText: String) in
            self.chanelLabel.text = chanelText
        }
        
        
        tv.volumeChanged = {(volume: Int) in
            self.volumeLabel.text = "\(volume)"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

