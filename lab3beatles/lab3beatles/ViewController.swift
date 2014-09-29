//
//  ViewController.swift
//  lab3beatles
//
//  Created by Chris on 9/28/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize=sender.value
        fontSizeNumberLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFontOfSize(fontSizeCGFloat)
    }
    @IBOutlet weak var fontSizeNumberLabel: UILabel!
    @IBOutlet weak var capitalizedSwitch: UISwitch!
    @IBAction func updateFont(sender: UISwitch) {
        updateCaps()
    }
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBAction func changeImage(sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var theBeatles: UIImageView!
    func updateImage(){
        if imageControl.selectedSegmentIndex==0 {
            titleLabel.text="Young Beatles"
            theBeatles.image=UIImage(named: "youngBeatles.jpg")
        }
        else if imageControl.selectedSegmentIndex==1 {
            titleLabel.text="Not so young Beatles"
            theBeatles.image=UIImage(named: "oldBeatles.jpg")
        }
    }
    func updateCaps() {
        if capitalizedSwitch.on {
            titleLabel.text=titleLabel.text?.uppercaseString
        }
        else {
            titleLabel.text=titleLabel.text?.lowercaseString
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


}

