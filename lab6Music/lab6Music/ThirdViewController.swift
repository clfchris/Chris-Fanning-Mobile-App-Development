//
//  ThirdViewController.swift
//  lab6Music
//
//  Created by Chris on 10/27/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var questionTextView: UITextView!
    @IBAction func submitQuestion(sender: UIButton) {
        var email : String
        email = "mailto:chfa5693@colorado.edu?subject=Question from music app&body=\(questionTextView.text) from \(nameField.text)\(emailField)"
        email = email.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        UIApplication.sharedApplication().openURL(NSURL.URLWithString(email))
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to:
            nil, from: nil, forEvent: nil)    }
    override func viewDidLoad() {
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
