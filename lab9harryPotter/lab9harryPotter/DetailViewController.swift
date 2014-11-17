//
//  DetailViewController.swift
//  lab9harryPotter
//
//  Created by Chris on 11/4/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
                self.loadWebPage(detail.description)
            }
        }
    }
    
    func loadWebPage (urlString: String){
        let url:NSURL = NSURL(string:urlString)!
        let request:NSURLRequest = NSURLRequest (URL: url)
        webView.loadRequest(request)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

