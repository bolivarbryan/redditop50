//
//  WebService.swift
//  ReddiTop50
//
//  Created by Bryan A Bolivar M on 9/4/17.
//  Copyright © 2017 bolivarbryan. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]

struct Resource<A> {
   let url: URL
   let parse: (Data) -> A?
}

extension Resource {
   init(url: URL,  parseJSON: @escaping (Any) -> A?) {
      self.url = url
      self.parse = { data in
         let json = try? JSONSerialization.jsonObject(with: data, options: [])
         return json.flatMap(parseJSON)
      }
   }
}

final class Webservice {
   func load<A>(_ resource: Resource<A>,_ completion: @escaping (A?) -> ()) {
      URLSession.shared.dataTask(with:resource.url) { data, _, _ in
         guard let data = data else {
            completion(nil)
            return
         }
         completion(resource.parse(data))
         }.resume()
   }
}
