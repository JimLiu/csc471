//
//  ViewController.swift
//  Calculator
//
//  Created by Jim Liu on 1/23/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var prevIsNumber = false
    var number1 = 0
    var number2 = 0
    var operation:String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func inputNumber(sender: AnyObject) {
        let numberStr: String! = sender.currentTitle!
        
        if prevIsNumber {
            if let number = Int("\(resultLabel.text!)\(numberStr)") {
                resultLabel.text = "\(number)"
            } else {
                resultLabel.text = "OVERFLOW"
            }
            
        } else {
            resultLabel.text = numberStr
            prevIsNumber = true
        }
    }

    @IBAction func operate(sender: AnyObject) {
        prevIsNumber = false
        if let number = Int(resultLabel.text!) {
            number1 = number
        } else {
            number1 = 0
        }
        operation = sender.currentTitle
    }
    
    @IBAction func calculate(sender: AnyObject) {
        if let number = Int(resultLabel.text!) {
            number2 = number
        } else {
            number2 = 0
        }
        
        resultLabel.text = "\(number1 + number2)"
        
        prevIsNumber = false
    }
}

