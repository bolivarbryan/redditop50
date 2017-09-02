//
//  Post.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import Foundation

class Post {
   let user: User
   let title: String
   let entryDate: Date
   let id: String
   var comments: [Comment]
   var image: RedditImage? = nil

   init(user: User, title: String, entryDate: Date, id: String) {
      self.user = user
      self.title = title
      self.entryDate = entryDate
      self.id = id
      self.comments = []
   }
}
