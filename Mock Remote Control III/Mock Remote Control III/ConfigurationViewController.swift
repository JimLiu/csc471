//
//  ConfigurationViewController.swift
//  Mock Remote Control III
//
//  Created by LIUJUNMIN on 2/22/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit

class ConfigurationViewController: UIViewController {
    @IBOutlet private weak var favoritesSegmented: UISegmentedControl!
    @IBOutlet private weak var chanelStepper: UIStepper!
    @IBOutlet private weak var labelTextField: UITextField!
    @IBOutlet private weak var chanelLabel: UILabel!
    
    var tv = TV.mine
    
    // show alert popup
    func showAlertMessage(title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: handler))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func reset() {
        let index = favoritesSegmented.selectedSegmentIndex
        let favorite = tv.favoriteChanels[index]
        chanelStepper.value = Double(favorite.number)
        labelTextField.text = favorite.name
        chanelLabel.text = Int(chanelStepper.value).description
        self.labelTextField.resignFirstResponder()
    }
    
    @IBAction func save(sender: UISwitch) {
        if let label = labelTextField.text where !label.isEmpty {
            //The label must be between 1-4 letters in length.
            if label.characters.count < 1 || label.characters.count > 4 {
                showAlertMessage("Warning", message: "The label must be between 1-4 letters in length!", handler: { action in
                    self.labelTextField.becomeFirstResponder()
                });
                return
            }
            let index = favoritesSegmented.selectedSegmentIndex
            tv.favoriteChanels[index] = Chanel(number: Int(chanelStepper.value), name: label)
            showAlertMessage("Congratulation", message: "You chanel has been added to your favorites!", handler: { action in
                self.labelTextField.resignFirstResponder()
            });
            
        } else {
            showAlertMessage("Warning", message: "The label is empty, please try again!", handler: { action in
                self.labelTextField.becomeFirstResponder()
            });
        }
    }
    
    @IBAction func cancel(sender: UIButton) {
        reset()
    }
    
    @IBAction func chanelChanged(sender: UIStepper) {
        chanelLabel.text = Int(sender.value).description
    }
    
    @IBAction func favoritesSegmentedChanged(sender: UISegmentedControl) {
        reset()
    }
    
    @IBAction func editEnded(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

