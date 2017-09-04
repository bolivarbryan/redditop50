//
//  PostListViewModel.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import Foundation

class PostListViewModel {
   fileprivate var posts: [Post]

   var numberOfPosts: Int {
      return posts.count
   }

   init() {
      self.posts =  []
   }

   func loadPosts(completion: @escaping (_ success: Bool) -> ())  {
      Webservice().load(PostListViewModel.all) { result in
         self.posts = result ?? []
         completion(true)
      }
   }

   func postAtIndex(index: Int) ->  PostViewModel {
      return PostViewModel(post: self.posts[index])
   }

   static let all = Resource<[Post]>(url: URL(string:Constants.Endpoints.top50Posts)! , parseJSON: { json in
      let json2 = ((json as? JSONDictionary)!["data"] as? JSONDictionary)!["children"]
      guard let dictionaries = json2 as? [JSONDictionary] else { return nil }
      return dictionaries.flatMap(Post.init)
   })
}

class PostViewModel: Equatable {
   enum PostType {
      case simple
      case thumbnailed
      case image
   }

   fileprivate let post: Post

   init(post: Post) {
      self.post = post
   }

   var postType: PostType {
      if post.image != nil {
         return .image
      }

      if post.thumbnail != nil {
         return .thumbnailed
      }

      return .simple
   }

   var image: RedditImage? {
      return post.image
   }

   var numberOfCommentsString: String {
      return "\(post.numberOfComments)"
   }

   var authorNameString: String {
      return post.user.name
   }

   var timeAgo: String {
      return DateHelper.timeAgoSinceDate(post.entryDate, currentDate: Date(), numericDates: false)
   }

   var title: String {
      return post.title
   }
   


   static func == (lhs: PostViewModel, rhs: PostViewModel) -> Bool {
      return lhs.post == rhs.post
   }
}
