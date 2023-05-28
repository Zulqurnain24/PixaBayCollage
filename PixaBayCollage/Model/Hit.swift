//
//  Hit.swift
//  PixaBayCollage
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

import Foundation

struct Hit: Decodable {
  let tags: String
  let previewURL: String
  let webformatURL: String
}

extension Hit: Identifiable {
  var id: String {UUID().uuidString}
}

extension Hit: Equatable {
  static func ==(lhs: Hit, rhs: Hit) -> Bool {
    lhs.id == rhs.id
  }
}
