//
//  ViewController.swift
//  helloworld2
//
//  Created by Christopher Lynn Fanning on 9/2/14.
//  Copyright (c) 2014 Christopher Lynn Fanning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var messageText: UILabel!
    @IBAction func buttonPressed(sender: UIButton) {
        messageText.text=sender.currentTitle + " World"
    }//method called buttonPressed
    //within parenthesis means it takes parameter
    override func viewDidLoad() {
        //creating a new function that already exists by overriding it for this instance
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

