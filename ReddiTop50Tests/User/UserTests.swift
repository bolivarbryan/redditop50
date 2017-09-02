//
//  UserTests.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import XCTest
@testable import ReddiTop50

class UserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

   func testInit_ShouldHaveAName() {
      // given
      let name = "jugodu"

      // when
      let user = User(name: name)

      // then
      XCTAssertEqual(user.name, "jugodu", "names doesn't match")

   }

   func testShouldHaveALinkInReddit() {
      // given
      let name = "jugodu"

      // when
      let user = User(name: name)

      // then
      XCTAssertEqual(user.link, URL(string:"https://www.reddit.com/user/jugodu/"), "URLs doesn't match")
   }
}
