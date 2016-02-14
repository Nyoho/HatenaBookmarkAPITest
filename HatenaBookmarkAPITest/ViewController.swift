//
//  ViewController.swift
//  HatenaBookmarkAPITest
//
//  Created by 北䑓 如法 on 16/2/12.
//  Copyright © 2016年 北䑓 如法. All rights reserved.
//

import Cocoa
import OAuthSwift

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func auth(viewController: AuthWebViewController) {
        let oauthswift = OAuth1Swift(
            consumerKey:     Config.consumerKey,
            consumerSecret:  Config.consumerSecret,
            // http://developer.hatena.ne.jp/ja/documents/auth/apis/oauth/consumer
            // scope をつける
            requestTokenUrl: "https://www.hatena.com/oauth/initiate?scope=read_public,write_public",
            authorizeUrl:    "https://www.hatena.ne.jp/oauth/authorize",
            accessTokenUrl:  "https://www.hatena.com/oauth/token"
        )
        oauthswift.authorize_url_handler = viewController
        oauthswift.authorizeWithCallbackURL(
            NSURL(string: "http://www.hatena.ne.jp")!,
            success: { credential, response, parameters in
                print("Success!")
                print(credential.oauth_token)
                print(credential.oauth_token_secret)
                print(parameters["user_id"])
            },
            failure: { error in
                print("Failure...orz")
                print(error.localizedDescription)
            }
        )
    }
    
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        switch (segue.identifier, segue.destinationController) {
        case ("OAuthWebView"?, let viewController as AuthWebViewController):
            auth(viewController)
        default:
            break
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

