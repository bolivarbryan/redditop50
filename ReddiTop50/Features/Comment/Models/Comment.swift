
//
//  Comment.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import Foundation

class Comment {
   let author: User
   let body:String
   var subcomments: [Comment]

   init(author: User, body: String) {
      self.author = author
      self.body = body
      self.subcomments = []
   }
}

extension Comment: Equatable {
   static func == (lhs: Comment, rhs: Comment) -> Bool {
      return lhs.body == rhs.body &&
            lhs.author == lhs.author
   }
}

