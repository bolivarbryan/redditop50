//
//  RedditImage.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import Foundation
import UIKit

class RedditImage {
   let urlString: String
   var height: Int? = 0
   var width: Int? = 0

   var url: URL? {
      if let urlObject = URL(string: urlString) {
         if UIApplication.shared.canOpenURL(urlObject) {
            return urlObject
         }
      }
      return nil
   }

   init(urlString: String) {
      self.urlString = urlString
   }

   init(urlString: String, height: Int, width: Int) {
      self.urlString = urlString
      self.height = height
      self.width = width
   }

   init?(dictionary: JSONDictionary) {
      guard let source = dictionary["source"] as? JSONDictionary,
            let url = source["url"] as? String else { return nil }
      self.urlString = url
   }

   var imageCache = [String:UIImage]()

   func getImage(url: String, imageView: UIImageView) {
      if let img = imageCache[url] {
         imageView.image = img
      } else {
         let request: URLRequest = URLRequest(url: URL(string: url)!)

         let mainQueue = OperationQueue.main

         NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
            if error == nil {
               let image = UIImage(data: data!)
               self.imageCache[url] = image

               DispatchQueue.main.async {
                  imageView.image = image
               }
            }
         })
      }
   }
}

extension RedditImage: Equatable {
   static func == (lhs: RedditImage, rhs: RedditImage) -> Bool {
      return lhs.url == rhs.url
   }
}
