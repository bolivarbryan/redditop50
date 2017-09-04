//
//  Post.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import Foundation

struct Post {
   let user: User
   var title: String
   var entryDate: Date
   var id: String
   var comments: [Comment]
   var image: RedditImage? = nil
   var numberOfComments: Int = 0
   var thumbnail: URL? = nil
   var isExternal: Bool = false
   var url: URL? = nil

   init(user: User, title: String, entryDate: Date, id: String) {
      self.user = user
      self.title = title
      self.entryDate = entryDate
      self.id = id
      self.comments = []
   }

   init?(dictionary: JSONDictionary) {
      guard let data = dictionary["data"] as? JSONDictionary,
         let id = data["id"] as? String,
         let title = data["title"] as? String,
         let user = data["author"] as? String
         else { return nil }

      self.id = id
      self.title = title
      self.user = User(name: user)
      self.title = title
      self.comments = []

      if let postHint = data["post_hint"] as? String {
         self.isExternal = postHint != "image"
      }

      if let urlString = data["url"] as? String, let url = URL(string:urlString) {
         self.url = url
      }

      if let numOfComments = data["num_comments"] as? Int{
         self.numberOfComments = numOfComments
      }

      if let created = data["created_utc"] as? Double {
         self.entryDate = Date(timeIntervalSince1970: created)
      } else {
         self.entryDate = Date()
      }

      guard let preview = data["preview"] as? JSONDictionary,
            let images = preview["images"] as? [JSONDictionary] else {
               return
      }

      if images.count > 0 {
         let image = RedditImage(dictionary: images.first!)
         self.image = image
      }

      guard let thumbnailString = data["thumbnail"] as? String, let thumbnail = URL(string: thumbnailString) else {
         return
      }
      self.thumbnail = thumbnail
   }
}

extension Post: Equatable {
   static func == (lhs: Post, rhs: Post) -> Bool {
      return lhs.id == rhs.id
   }
}
