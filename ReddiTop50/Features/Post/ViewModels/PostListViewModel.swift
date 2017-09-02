//
//  PostListViewModel.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import Foundation

class PostListViewModel {
   fileprivate let posts: [Post]

   var numberOfPosts: Int {
      return posts.count
   }

   init(posts: [Post]) {
      self.posts = posts
   }

   func postAtIndex(index: Int) ->  PostViewModel {
      return PostViewModel(post: self.posts[index])
   }
}

class PostViewModel: Equatable {
   fileprivate let post: Post

   var numberOfCommentsString: String {
      return "\(post.numberOfComments)"
   }

   var authorNameString: String {
      return post.user.name
   }

   var timeAgo: String {
      return DateHelper.hoursAgoSinceDate(post.entryDate, currentDate: Date(), numericDates: false)
   }

   init(post: Post) {
      self.post = post
   }

   static func == (lhs: PostViewModel, rhs: PostViewModel) -> Bool {
      return lhs.post == rhs.post
   }
}
