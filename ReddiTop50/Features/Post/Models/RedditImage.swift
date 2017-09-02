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
}

extension RedditImage: Equatable {
   static func == (lhs: RedditImage, rhs: RedditImage) -> Bool {
      return lhs.url == rhs.url
   }
}


