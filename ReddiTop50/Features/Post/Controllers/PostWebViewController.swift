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
   var url: URL?

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
   }

   override func viewDidLoad() {
      super.viewDidLoad()
      if let url = url {
         let request = URLRequest(url: url)
         webView?.loadRequest(request)
      }
   }
   
}
