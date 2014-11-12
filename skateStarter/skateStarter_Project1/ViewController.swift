//
//  ViewController.swift
//  skateStarter_Project1
//
//  Created by Chris on 10/4/14.
//  Copyright (c) 2014 Chris. All rights reserved.
// information for skateboard statistics taken from www.warehouseskateboards.com and skateboard.about.com

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageEntry: UITextField!
    @IBOutlet weak var shoeResult: UITextField!
    @IBOutlet weak var nameFieldEntry: UITextField!
    @IBOutlet weak var heightResult: UITextField!
    @IBOutlet weak var nameLabelResult: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBAction func skaterType(sender: UISegmentedControl) {
        if imageControl.selectedSegmentIndex==0 {
            let age = (ageEntry.text as NSString).intValue
            if age<=5 && age>0 {
                ageLabel.text="Aren't you a little young to skate?"
            }
            else {
                ageLabel.text="You are at the perfect age to skate!"
            }
            if (heightResult.text as NSString).floatValue>0 && (shoeResult.text as NSString).floatValue>0 && (ageEntry.text as NSString).floatValue>0{
            nameLabelResult.text="\(nameFieldEntry.text)"+", your ideal skateboard is: \(heightConverter()) inches long and \(widthConverter()) inches wide with wheels that are 55-65mm wide and a durometer of 95-100a."
            }
            else {
                let alert=UIAlertController(title: "Warning", message: "No skater is a 0!", preferredStyle: UIAlertControllerStyle.Alert)
                let cancelAction:UIAlertAction=UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction)
                let okAction:UIAlertAction=UIAlertAction(title: "Got It", style: UIAlertActionStyle.Default, handler: {action in self.heightResult.text="1"; self.ageEntry.text="1"; self.shoeResult.text="1"})
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        if imageControl.selectedSegmentIndex==1 {
            let age = (ageEntry.text as NSString).intValue
            if age<=5 && age>0 {
                ageLabel.text="Aren't you a little young to skate?"
            }
            else {
                ageLabel.text="You are at the perfect age to skate!"
            }
            if (heightResult.text as NSString).floatValue>0 && (shoeResult.text as NSString).floatValue>0 && (ageEntry.text as NSString).floatValue>0{
            nameLabelResult.text="\(nameFieldEntry.text)"+", your ideal skateboard is: \(heightConverter()) inches long and \(widthConverter()) inches wide with wheels that are 50-55mm wide and a durometer of 97-101a."
            }
            else {
                let alert=UIAlertController(title: "Warning", message: "No skater is a 0!", preferredStyle: UIAlertControllerStyle.Alert)
                let cancelAction:UIAlertAction=UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction)
                let okAction:UIAlertAction=UIAlertAction(title: "Got It", style: UIAlertActionStyle.Default, handler: {action in self.heightResult.text="1"; self.ageEntry.text="1"; self.shoeResult.text="1"})
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
        if imageControl.selectedSegmentIndex==2 {
            let age = (ageEntry.text as NSString).intValue
            if age<=5 && age>0 {
                ageLabel.text="Aren't you a little young to skate?"
            }
            
            else {
                ageLabel.text="You are at the perfect age to skate!"
            }
            if (heightResult.text as NSString).floatValue>0 && (shoeResult.text as NSString).floatValue>0 && (ageEntry.text as NSString).floatValue>0 {
            nameLabelResult.text="\(nameFieldEntry.text)"+", your ideal skateboard is: \(heightConverter()) inches long and \(widthConverter()) inches wide with wheels that are 52-60mm wide and a durometer of 95-100a."
            }
            else {
                let alert=UIAlertController(title: "Warning", message: "No skater is a 0!", preferredStyle: UIAlertControllerStyle.Alert)
                let cancelAction:UIAlertAction=UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
                alert.addAction(cancelAction)
                let okAction:UIAlertAction=UIAlertAction(title: "Got It", style: UIAlertActionStyle.Default, handler: {action in self.heightResult.text="1"; self.ageEntry.text="1"; self.shoeResult.text="1"})
                alert.addAction(okAction)
                presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    func heightConverter()->Float {
        let height = (heightResult.text as NSString).floatValue
        var skateLength: Float
        skateLength=1
        if height<=48 && height>0 {
            skateLength=29
        }
        else if height<=58 && height>48 {
            skateLength=30
        }
        else if height>58 && height<=63 {
            skateLength=31
        }
        else if height>63 && height<=72 {
            skateLength=32
        }
        else if height>72 {
            skateLength=32.4
        }
    return skateLength
    }
    
    func widthConverter()->Float {
        let width = (shoeResult.text as NSString).floatValue
        var skateWidth: Float
        skateWidth=1
        if width<=3 && width>0{
            skateWidth=6.5
        }
        if width>3 && width<=6 {
            skateWidth=7
        }
        if width>6 && width<=8 {
            skateWidth=7.3
        }
        if width>8 {
            skateWidth=8
        }
        
        return skateWidth
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    //the above code was used to dismiss the keyboard by touching else where on the screen, and it was borrowed from www.ios-blog.co.uk/tutorials/developing-ios8-apps-using-swift-create-a-to-do-application/
    override func viewDidLoad() {
        ageEntry.delegate=self
        shoeResult.delegate=self
        nameFieldEntry.delegate=self
        heightResult.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
