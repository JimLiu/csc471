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
    @IBOutlet private weak var operatorSegmented: UISegmentedControl!
    @IBOutlet private weak var labelTextField: UITextField!
    @IBOutlet private weak var chanelLabel: UILabel!
    
    
    @IBAction func save(sender: UISwitch) {

    }
    
    @IBAction func cancel(sender: UIButton) {

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

