//
//  ThirdViewController.swift
//  skateStarter_Project1
//
//  Created by Chris on 11/10/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var skateWeb: UIWebView!
    
    func loadWebPage(urlString: String){
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        skateWeb.loadRequest(request)
    }
    
    override func viewDidLoad() {
        skateWeb.delegate=self
        loadWebPage("https://www.zumiez.com")
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
