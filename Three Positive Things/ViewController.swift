//
//  ViewController.swift
//  Three Positive Things
//
//  Created by Zack Shapiro on 10/19/14.
//  Copyright (c) 2014 com.59thirty.com. All rights reserved.
//

import UIKit
import CoreData

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
        
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        // Save the entry
        var newEntry = NSEntityDescription.insertNewObjectForEntityForName("Entries", inManagedObjectContext: managedContext) as NSManagedObject
        newEntry.setValue(first, forKey: "firstEntry")
        newEntry.setValue(second, forKey: "secondEntry")
        newEntry.setValue(third, forKey: "thirdEntry")
        newEntry.setValue(NSDate(), forKey: "date")
        
        managedContext.save(nil)
        println(newEntry)
        println("Object saved!")
        
        // if CoreData responds with success, unhide the serverReturnLabel
        // and show green text with a message of "your entry has been recorded"
        // else, red label, message "there was a problem saving your entry"
        
        // button setTitle back to 'Send'
        // submitButton.setTitle("Send", forState: UIControlState.Normal)
    }
}

