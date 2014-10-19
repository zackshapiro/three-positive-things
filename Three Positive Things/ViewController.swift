//
//  ViewController.swift
//  Three Positive Things
//
//  Created by Zack Shapiro on 10/19/14.
//  Copyright (c) 2014 com.59thirty.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var serverReturnLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitButtonPressed(sender: UIButton) {
        resignFirstResponder()
        submitButton.setTitle("Sending...", forState: UIControlState.Normal)
        
        var first = firstField.text
        var second = secondField.text
        var third = thirdField.text
        
        var obj = [
            "first": first,
            "second": second,
            "third": third
        ]
        
        println(obj)
        
        // if coredata responds with a 200, unhide the serverReturnLabel
        // and show green text with a message of "your entry has been recorded"
        // else, red label, message "there was a problem saving your entry"
        
        // button setTitle back to 'Send'
        
        // nice to have: don't let the user submit if any field is blank
    }
}

