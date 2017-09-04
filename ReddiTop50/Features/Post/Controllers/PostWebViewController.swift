//
//  PostWebViewController.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/3/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import UIKit

class PostWebViewController: UIViewController {
   @IBOutlet weak var webView: UIWebView?

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
   }

   override func viewDidLoad() {
      super.viewDidLoad()
      if let url = URL(string: "http://apple.com") {
         let request = URLRequest(url: url)
         webView?.loadRequest(request)
      }
   }
   
}
