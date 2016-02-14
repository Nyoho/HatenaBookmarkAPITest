//
//  AuthWebViewController.swift
//  HatenaBookmarkAPITest
//
//  Created by 北䑓 如法 on 16/2/13.
//  Copyright © 2016年 北䑓 如法. All rights reserved.
//

import Cocoa
import WebKit
import OAuthSwift

class AuthWebViewController: NSViewController, OAuthSwiftURLHandlerType, WebFrameLoadDelegate, WebUIDelegate {

    @IBOutlet weak var webView: WebView!
    var targetURL: NSURL = NSURL()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frameLoadDelegate = self
        webView.UIDelegate = self
    }

    func handle(url: NSURL) {
        webView.mainFrame.loadRequest(NSURLRequest(URL: url))
    }

    func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!) {
        guard sender.mainFrame == frame else { return }

        if let urlString = frame.dataSource?.request.URL?.absoluteString, let url = frame.dataSource?.request.URL {
            print(frame.dataSource?.request)
            print(frame.dataSource?.response)
            print("did finish URL: \(urlString)")
            if let u = frame.dataSource?.request.URL?.absoluteString
                where u.hasPrefix("http://www.hatena.ne.jp/")
            {
                print("Arrived callback page")
                OAuthSwift.handleOpenURL(url)
                self.dismissController(self)
            }
        }
    }
    
    func webView(sender: WebView!, didStartProvisionalLoadForFrame frame: WebFrame!) {
        guard sender.mainFrame == frame else { return }

        if let url = frame.provisionalDataSource.request.URL?.absoluteString {
            print("did start URL : \(url)")
        }
    }

    
    func webView(sender: WebView!, runJavaScriptAlertPanelWithMessage message: String!, initiatedByFrame frame: WebFrame!) {
        print(message)
    }

    func webView(sender: WebView!, runJavaScriptConfirmPanelWithMessage message: String!, initiatedByFrame frame: WebFrame!) -> Bool {
        return true
    }

}
