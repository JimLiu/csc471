//
//  ViewController.swift
//  ShoppingList
//
//  Created by Jim Liu on 2/8/16.
//  Copyright © 2016 Jim Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var listText: UITextView!
    @IBOutlet var descriptionTextFiled: UITextField!
    @IBOutlet var quantityTextFiled: UITextField!
    
    // shopping list
    var list:[Item] = [] {
        didSet {
            if (self.list.count > 0) {
                listText.text = self.list.map{$0.toString()}.joinWithSeparator("\n")
            } else {
                listText.text = "No Item"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // show alert popup
    func showAlertMessage(message: String, sender: UITextField) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: { action in
            sender.becomeFirstResponder()
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func clearInput() {
        self.quantityTextFiled.text = ""
        self.descriptionTextFiled.text = ""
        self.descriptionTextFiled.resignFirstResponder()
        self.quantityTextFiled.resignFirstResponder()
    }
    
    func addNewItem() {
        if let description = descriptionTextFiled.text where !description.isEmpty
        {
            if let quantity = Int(quantityTextFiled.text!) {
                list.append(Item(quantity: quantity, description: description))
                clearInput()
            } else {
                showAlertMessage("Quantity is empty or not valid number, please try again!", sender: self.quantityTextFiled)
            }
            
        } else {
            showAlertMessage("Descript is empty, please try again!", sender: self.descriptionTextFiled);
        }
    }
    
    @IBAction func editEnded(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func handleNewList(sender: UIButton) {
        list = []
    }

    @IBAction func handleNewItem(sender: UIButton) {
        clearInput()
    }

    
    @IBAction func handleAdd(sender: UIButton) {
        addNewItem()
    }
    

    @IBAction func endOnExit(sender: UITextField) {
        if sender == descriptionTextFiled {
            quantityTextFiled.becomeFirstResponder()
        } else {
            addNewItem()
        }
    }
}

