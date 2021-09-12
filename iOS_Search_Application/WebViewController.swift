//
//  WebViewController.swift
//  iOS_Search_Application
//
//  Created by Ankit sharma7 on 13/09/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {

    @IBOutlet var webView: WKWebView?
    
    public var loadUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: loadUrl) else {
                    return
                }
        let requestObj = NSURLRequest(url: url, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5.0 )
        self.webView?.uiDelegate = self
        webView?.load(requestObj as URLRequest)
    }



    

}
