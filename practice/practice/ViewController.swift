//
//  ViewController.swift
//  practice
//
//  Created by Chris on 9/15/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelChange: UILabel!
    @IBAction func press(sender: UIButton) {
        //labelChange.text = "goodbye"
        if labelChange.text=="goodbye"{
            labelChange.text="hello again"
        }
        else{
            labelChange.text="goodbye"
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

