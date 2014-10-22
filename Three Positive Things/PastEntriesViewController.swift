//
//  PastEntriesViewController.swift
//  Three Positive Things
//
//  Created by Zack Shapiro on 10/19/14.
//  Copyright (c) 2014 com.59thirty.com. All rights reserved.
//

import UIKit
import CoreData

class PastEntriesViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var entries = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"Past Entries\""
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // table view will have as many rows as names has in count
        // this is very common code to see for table views
        return entries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        let entry = entries[indexPath.row]
        cell.textLabel!.text = entry.valueForKey("first") as String?
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Entry")
        
        //3
        var error: NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as [NSManagedObject]?
        
        if let results = fetchedResults {
            entries = results
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
    }
}

