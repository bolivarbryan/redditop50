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
      let post = Post(user: user, title: "Let's talk about the networking layer of the Swift talk app. We think it's an interesting example to look at because we designed it differently than in previous Objective-C projects. Typically, we would have created some kind of a Webservice class with individual methods that perform calls to particular endpoints. These methods return the data that we get back from these endpoints via a callback. For example, we could have a loadEpisodes method, which makes the network call, parses the result, instantiates some Episode objects, and returns an array with the episodes. We could also have a similar loadMedia method, which goes through the same steps to load the media for a particular episode", entryDate: Date(), id: "abc")
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
