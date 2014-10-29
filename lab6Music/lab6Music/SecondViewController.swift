//
//  SecondViewController.swift
//  lab6Music
//
//  Created by Chris on 10/27/14.
//  Copyright (c) 2014 Chris. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var musicWebView: UIWebView!
    @IBOutlet weak var musicSpinner: UIActivityIndicatorView!
    
    func loadWebPage(urlString: String){
        let url = NSURL.URLWithString(urlString)
        let request = NSURLRequest(URL: url)
        musicWebView.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        musicSpinner.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        musicSpinner.stopAnimating()
    }
    
    override func viewDidLoad() {
        musicWebView.delegate=self
        loadWebPage("https://www.apple.com/itunes")
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

