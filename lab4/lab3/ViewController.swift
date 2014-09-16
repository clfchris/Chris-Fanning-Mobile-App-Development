//
//  ViewController.swift
//  lab3
//
//  Created by Christopher Lynn Fanning on 9/16/14.
//  Copyright (c) 2014 Christopher Lynn Fanning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fontSizeNumberLabel: UILabel!
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize=sender.value
        fontSizeNumberLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFontOfSize(fontSizeCGFloat)
        
    }
    @IBAction func capital(sender: UISwitch) {
        updateCaps()
    }
    @IBOutlet weak var capitalization: UISwitch!
    @IBAction func changeImage(sender: UISegmentedControl) {
        updateImage()    }
    @IBOutlet weak var aeroImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateCaps(){
        if capitalization.on {
            titleLabel.text=titleLabel.text.uppercaseString
        }
        else {
            titleLabel.text=titleLabel.text.lowercaseString
        }
    }
    func updateImage(){
        if imageControl.selectedSegmentIndex==0 {
            titleLabel.text="Old Aerosmith"
            aeroImage.image=UIImage(named: "aerosmith1")
        }
        else if imageControl.selectedSegmentIndex==1 {
            titleLabel.text="New Aerosmith"
            aeroImage.image=UIImage(named: "aerosmith2")
        }

    }


}

