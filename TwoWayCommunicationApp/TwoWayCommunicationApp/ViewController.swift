//
//  ViewController.swift
//  TwoWayCommunicationApp
//
//  Created by Mike Newell on 8/7/15.
//  Copyright (c) 2015 Mike Newell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewWillAppear(animated: Bool) {
        if let url = NSBundle.mainBundle().URLForResource("index", withExtension: "html", subdirectory: "web") {
            let fragUrl = NSURL(string: "#FRAG_URL", relativeToURL: url)!
            let request = NSURLRequest(URL: fragUrl)
            webView.delegate = self
            webView.loadRequest(request)
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
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        NSLog("request: \(request)")
        
        if let scheme = request.URL?.scheme {
            if scheme == "mike" {
                // now we can react
                
                NSLog("we got a mike request: \(scheme)")
                
                if let result = webView.stringByEvaluatingJavaScriptFromString("MIKE.someJavascriptFunc()") {
                    NSLog("result: \(result)")
                }
                return false
            }
        }
        return true
    }
        
}

