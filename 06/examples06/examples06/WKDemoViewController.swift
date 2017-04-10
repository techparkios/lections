//
//  WKDemoViewController.swift
//  examples06
//
//  Created by Gennady Evstratov on 08/04/2017.
//  Copyright © 2017 Gennady Evstratov. All rights reserved.
//

import UIKit
import WebKit
import PureLayout

class WKDemoViewController: UIViewController, WKNavigationDelegate {
    
    
    let webView = WKWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.autoPinEdgesToSuperviewEdges()
        webView.load(URLRequest(url: URL(string: "http://127.0.0.1:3000/test.html")!))
        webView.navigationDelegate = self
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard navigationAction.request.url?.absoluteString == "http://127.0.0.1:3000/test1.html" else {
            decisionHandler(.allow)
            return
        }
        
        decisionHandler(.cancel)
        let vc = UIAlertController(title: "", message: "bad navigation", preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(vc, animated: true, completion: nil)
    }
}
