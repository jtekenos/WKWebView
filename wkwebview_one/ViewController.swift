//
//  ViewController.swift
//  wkwebview_one
//
//  Created by Jessica Tekenos on 2015-11-08.
//  Copyright © 2015 Jessica Tekenos. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {

    @IBOutlet var containerView : UIView? = nil
    var webView: WKWebView?
    
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        if(message.name == "callbackHandler") {
           let urlgo = NSURL(string: "https://apple.com")
            let reqgo = NSURLRequest(URL: urlgo!)
            self.webView!.loadRequest(reqgo)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let jsURL = NSBundle.mainBundle().URLForResource("index", withExtension: "html")
        let req = NSURLRequest(URL: jsURL!)
        self.webView!.loadRequest(req)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func loadView() {
        super.loadView()
        
        let contentController = WKUserContentController()

        contentController.addScriptMessageHandler(
            self,
            name: "callbackHandler"
        )
        
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        self.webView = WKWebView(
            frame: self.containerView!.bounds,
            configuration: config
        )
        self.view = self.webView
    }

    
}

