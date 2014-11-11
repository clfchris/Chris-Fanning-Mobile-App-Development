//
//  ViewController.swift
//  scrabbleQ
//
//  Created by Chris on 10/29/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    var words = [String]()
    var allwords = NSDictionary()
    var letters = [String]()
    override func viewDidLoad() {
        let path = NSBundle.mainBundle().pathForResource("qwordswithoutu2", ofType: "plist")
        //words = NSArray(contentsOfFile: path!) as Array
        allwords = NSDictionary(contentsOfFile: path!)!
        letters = allwords.allKeys as [String]
        letters.sort({$0 < $1})
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let letter = letters[section]
        let letterSection = allwords.objectForKey(letter) as [String]
        return letterSection.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let letter = letters[section]
        let wordsSection = allwords.objectForKey(letter) as [String]
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text=wordsSection[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = indexPath.section
        let letter = letters[section]
        let wordsSection = allwords.objectForKey(letter) as [String]
        let alert = UIAlertController(title: "Row selected", message: "You selected \(wordsSection[indexPath.row])", preferredStyle: UIAlertControllerStyle.Alert)
        let okaction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(okaction)
        self.presentViewController(alert, animated: true, completion: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return letters.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return letters[section]
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        return letters
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

