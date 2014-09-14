//
//  ViewController.swift
//  lab3
//
//  Created by Christopher Lynn Fanning on 9/9/14.
//  Copyright (c) 2014 Christopher Lynn Fanning. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var batman: UIImageView!
    @IBAction func choseHero(sender: UIButton) {
        if sender.tag==1{
            batman.image=UIImage(named: "batman.jpg")
        }
        if sender.tag==2{
            batman.image=UIImage(named: "2361233-superman.jpg")
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

