//
//  ViewController.swift
//  Countries
//
//  Created by Chris on 10/23/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var continentList=Continents()

    override func viewDidLoad() {
        let path = NSBundle.mainBundle().pathForResource("continents", ofType: "plist")
        continentList.continentData = NSMutableDictionary(contentsOfFile: path!)
        continentList.continents = continentList.continentData.allKeys as [String]
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continentList.continentData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text=continentList.continents[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier=="countrySegue"{
            var countryVC=segue.destinationViewController as DetailViewController
            let indexPath:NSIndexPath=tableView.indexPathForSelectedRow()!
            //sets the data for the destination controller
            countryVC.title=continentList.continents[indexPath.row]
            countryVC.continentCountries=continentList
            countryVC.selectedContinent=indexPath.row
            NSLog("prepare for segue\(indexPath.row)")
        }
        else if segue.identifier=="continentSegue"{
            var infoVC=segue.destinationViewController as ContinentInfoTableTableViewController
            let editingCell:UITableViewCell=sender as UITableViewCell
            let indexPath:NSIndexPath=tableView.indexPathForCell(editingCell)!
            infoVC.name=continentList.continents[indexPath.row]
            let countries=continentList.continentData.objectForKey(infoVC.name) as
                [String]
            infoVC.number=String(countries.count)
        }
    }


}

