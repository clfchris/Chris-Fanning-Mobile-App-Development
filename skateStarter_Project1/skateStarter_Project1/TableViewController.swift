//
//  TableViewController.swift
//  skateStarter_Project1
//
//  Created by Chris on 11/11/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    //required init(coder aDecoder: NSCoder) {
    //    fatalError("init(coder:) has not been implemented")
    //}
    var words = [String]()
    override func viewDidLoad() {
        let path = NSBundle.mainBundle().pathForResource("skatetionary", ofType: "plist")
        words = NSArray(contentsOfFile: path!) as Array
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text=words[indexPath.row]
        return cell
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
