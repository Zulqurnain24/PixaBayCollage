//
//  NetworkError.swift
//  PixaBayCollage
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

import Foundation

enum NetworkError: Error {
  case urlError
  case responseError(Int)
  case dataParseError
  case requestError(Error)
}

extension NetworkError: Equatable {
  static func ==(lhs: NetworkError, rhs: NetworkError) -> Bool {
    switch (lhs, rhs) {
    case (.urlError, .urlError):
      return true
    case let (.responseError(int1), .responseError(int2)):
      return int1 == int2
    case let (.dataParseError, .dataParseError):
      return true
    case let (.requestError(error1), .requestError(error2)):
      return error1.localizedDescription  == error2.localizedDescription
    default:
      return false
    }
  }
}

