//
//  PostWebViewController.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/3/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import UIKit
import WebKit

class PostWebViewController: UIViewController {
   var webView: WKWebView!

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
   }

   override func loadView() {
      let webConfiguration = WKWebViewConfiguration()
      webView = WKWebView(frame: .zero, configuration: webConfiguration)
      webView.uiDelegate = self
      view = webView
   }
   override func viewDidLoad() {
      super.viewDidLoad()

      let myURL = URL(string: "https://www.apple.com")
      let myRequest = URLRequest(url: myURL!)
      webView.load(myRequest)
   }
   
}
extension PostWebViewController: WKUIDelegate {

}
