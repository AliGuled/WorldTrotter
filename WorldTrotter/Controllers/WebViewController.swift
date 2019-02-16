//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Guled Ali on 2/14/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    
    //Creating web view object
    var webView: WKWebView!
    
    //Loading the web view to the scene
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        view = webView
        webView.navigationDelegate = self
    
    }
    //Loading the url to the webview
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.bignerdranch.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    

}
