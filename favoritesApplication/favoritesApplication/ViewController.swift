//
//  ViewController.swift
//  favoritesApplication
//
//  Created by Chris on 10/16/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bookLabel: UILabel!
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        bookLabel.text=user.favBook
        authorLabel.text=user.favAuthor
    }
    
    var user = Favorite()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

