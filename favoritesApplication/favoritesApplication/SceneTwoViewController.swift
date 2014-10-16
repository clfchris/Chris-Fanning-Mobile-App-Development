//
//  SceneTwoViewController.swift
//  favoritesApplication
//
//  Created by Chris on 10/16/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class SceneTwoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bookField: UITextField!
    @IBOutlet weak var authorField: UITextField!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {textField.resignFirstResponder()
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "doneFavs"{
            var scene1ViewController:ViewController = segue.destinationViewController as ViewController
            scene1ViewController.user.favBook=bookField.text
            scene1ViewController.user.favAuthor=authorField.text            
        }
    }
    
    override func viewDidLoad() {
        bookField.delegate=self
        authorField.delegate=self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
