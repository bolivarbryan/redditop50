//
//  UIImageView+URL.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/4/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import UIKit

extension UIImageView {
   public func imageFromServerURL(urlString: String) {
      URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
         if error != nil {
            return
         }
         DispatchQueue.main.async(execute: { () -> Void in
            let image = UIImage(data: data!)
            self.image = image
         })
      }).resume()
   }
}
