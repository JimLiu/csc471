//
//  ViewController.swift
//  HelloWorld
//
//  Created by Jim Liu on 1/11/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var helloLabel: UILabel!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textChanged(sender: UITextField) {
        helloLabel.text = "Hello \(sender.text!)!";
    }

}

