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
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

   func testInit_ShouldHaveAnIDTitleAuthorEntryAndComments() {
      //given
      let user = User(name: "bryan")
      let title = "Ned Stark is alive"
      let entryDate = Date(timeIntervalSince1970: 100)
      let postID = "abcdx"

      //when
      let post = Post(user: user, title: title, entryDate: entryDate, id: postID)

      //then
      XCTAssertEqual(post.user, user)
      XCTAssertEqual(post.comments, [])
      XCTAssertEqual(post.entryDate, Date(timeIntervalSince1970: 100))
   }
    
}
