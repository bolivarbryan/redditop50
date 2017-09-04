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
      self.posts = []

      //TODO: get data from api
      let user = User(name: "bryan")
      let post = Post(user: user, title: "hola mundo", entryDate: Date(), id: "abc")
      let post2 = Post(user: user, title: "Paul and I can’t believe how quickly the week went by. It was so great to see you. Come visit us again soon and let us know how it goes…", entryDate: Date(), id: "abc")
      let post3 = Post(user: user, title: "This is a post with a thumbnail, please pay attention. This is a post with a thumbnail, repeat... chango down", entryDate: Date(), id: "abc")
      let d = Date(timeIntervalSince1970: 1)
      let post4 = Post(user: user, title: "hola mundo 4", entryDate: d , id: "abc")
      post3.thumbnail = URL(string: "sknss")
      post2.image = RedditImage(urlString: "hellou")
      self.posts = [post, post2, post3, post4]
   }

   init(posts: [Post]) {
      self.posts = posts
   }

   func postAtIndex(index: Int) ->  PostViewModel {
      return PostViewModel(post: self.posts[index])
   }
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
