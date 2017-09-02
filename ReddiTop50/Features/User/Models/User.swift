//
//  User.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/2/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import Foundation

class User {
   var name: String
   var created: Date?
   var linkKarma: Int? = 0
   var commentKarma: Int? = 0

   init(name: String) {
      self.name = name
   }

   init(name: String, created: Date, linkKarma: Int, commentKarma: Int) {
      self.name = name
      self.created = created
      self.linkKarma = linkKarma
      self.commentKarma = commentKarma
   }
}

extension User {
   var link: URL? {
      return URL(string: "\(Constants.Endpoints.base)user/\(name)/")
   }
}


extension User: Equatable {
   static func == (lhs: User, rhs: User) -> Bool {
      return lhs.name == rhs.name
   }
}
