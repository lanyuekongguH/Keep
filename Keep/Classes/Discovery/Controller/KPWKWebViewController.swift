//
//  KPWKWebViewController.swift
//  Keep
//
//  Created by Damon on 17/5/10.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import WebKit

class KPWKWebViewController: UIViewController {

    private var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let webview = WKWebView(frame: CGRect(x: 0, y: 0, width: SCREENW, height: SCREENH))
//        let url = URL(string: "https://show.gotokeep.com/entry/590d2dc204e156717fbb3a28")
        let url = URL(string: "https://show.gotokeep.com/explore/")
        let request = URLRequest(url: url!)
        webview.load(request)
        view.addSubview(webview)
    }

}
