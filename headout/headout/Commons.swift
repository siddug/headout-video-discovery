//
//  Commons.swift
//  headout
//
//  Created by Siddhartha on 18/02/17.
//  Copyright © 2017 headout. All rights reserved.
//

import UIKit

func getWebView(url: String, frame: CGRect) -> UIWebView {
    let webview = UIWebView.init(frame: frame)
    webview.loadRequest(NSURLRequest(url: NSURL(string: url) as! URL) as URLRequest)
    return webview;
}
