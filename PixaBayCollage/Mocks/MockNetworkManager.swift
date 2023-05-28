//
//  MockNetworkManager.swift
//  PixaBayCollageTests
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

import Combine
import Foundation

class MockNetworkManager: NetworkManagerProtocol {
  var error: NetworkError? = nil
  let decoder: JSONDecoder = JSONDecoder()
  let url: URL? = nil
  
  func fetchHitsList() -> AnyPublisher<HitsList, NetworkError> {
    guard error == nil else {
      return Empty<HitsList, NetworkError>()
        .eraseToAnyPublisher()
    }
    if let url = Bundle.main.url(forResource: "hitsList", withExtension: "json"),
       let data = try? Data(contentsOf: url) {
      do {
        let hitsList = try decoder.decode(HitsList.self, from: data)
        return Just(hitsList)
          .setFailureType(to: NetworkError.self) // Set the failure type to NetworkError
          .eraseToAnyPublisher()
      } catch {
        print("Error decoding JSON: \(error)")
      }
    }
    return Empty<HitsList, NetworkError>()
      .eraseToAnyPublisher()
  }
}
