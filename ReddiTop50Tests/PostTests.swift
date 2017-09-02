//
//  PostTests.swift
//  ReddiTop50Tests
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import XCTest
@testable import ReddiTop50

class PostTests: XCTestCase {
   let user = User(name: "bryan")
   let title = "Ned Stark is alive"
   let postID = "abcdx"
   let entryDate = Date(timeIntervalSince1970: 100)

   override func setUp() {
      super.setUp()
   }

   override func tearDown() {
      super.tearDown()
   }

   func testInit_ShouldHaveAnIDTitleAuthorEntryAndComments() {
      //given

      //when
      let post = Post(user: user, title: title, entryDate: entryDate, id: postID)

      //then
      XCTAssertEqual(post.user, user)
      XCTAssertEqual(post.comments, [])
      XCTAssertEqual(post.entryDate, Date(timeIntervalSince1970: 100))
      XCTAssertEqual(post.title, title)
   }

   func testImageURL_IsValid() {
      //given

      let post = Post(user: user, title: title, entryDate: entryDate, id: postID)

      //when
      let image = RedditImage(urlString: "https://i.redditmedia.com/lEOvsG5kr0zb9ej9WnuRyjJs_OtLbui25b8G1vZb1N0.jpg?s=b6d65666975fca577e98ae67beedc573", height: 100, width: 100)
      post.image = image

      //then
      XCTAssertEqual(post.image!, image)
      XCTAssertNotNil(post.image?.url, "invalid url")
   }

   func testComments_ShouldHaveOne()  {
      //given
      let post = Post(user: user, title: title, entryDate: entryDate, id: postID)

      //when
      let comment = Comment(author: user, body: "this is great")
      post.comments.append(comment)

      //then
      XCTAssertEqual(post.comments.count, 1)
   }

   func testViewModel_ShouldHaveAListOfPosts() {
      //given
      let post = Post(user: user, title: title, entryDate: entryDate, id: postID)
      post.id = "abc"

      //when
      let post2 = Post(user: user, title: "another title", entryDate: Date(), id: "abc")
      let postListViewModel = PostListViewModel(posts: [post])
      let postViewModel = PostViewModel(post: post2)

      //then
      XCTAssertEqual(postListViewModel.postAtIndex(index: 0), postViewModel, "Posts doesn't match")
   }

   func testViewModel_ShouldReturnNumberOfPosts() {
      //given
      let post = Post(user: user, title: title, entryDate: entryDate, id: postID)
      post.id = "abc"

      //when
      let postListViewModel = PostListViewModel(posts: [post])

      //then
      XCTAssertEqual(postListViewModel.numberOfPosts, 1)
   }
   
}
