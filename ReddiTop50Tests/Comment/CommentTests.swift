//
//  CommentTests.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import XCTest
@testable import ReddiTop50

class CommentTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

   func testInit_ShouldHaveABodyAndAuthor() {
      // given
      let body = "Hello world from Colombia!"
      let author = User(name: "bolivarbryan")

      // when
      let comment = Comment(author: author, body: body)
      let user2 = User(name: "bolivarbryan")
      // then
      XCTAssertEqual(comment.author, user2)
      XCTAssertEqual(comment.body, "Hello world from Colombia!")
   }

   func testSubComments_ShouldBeAnArrayOfComments() {
      // given
      let comment = Comment(author: User(name: "bolivarbryan"), body: "hello")

      //when
      let subComment = Comment(author: User(name: "jugodu"), body: "world")
      comment.subcomments = [subComment]

      // then
      XCTAssertEqual(comment.subcomments.first, subComment)
   }
}
