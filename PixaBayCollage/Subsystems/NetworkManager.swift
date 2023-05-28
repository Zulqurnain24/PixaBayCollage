//
//  NetworkManager.swift
//  PixaBayCollage
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

import Combine
import Foundation

protocol NetworkManagerProtocol {
  var decoder: JSONDecoder { get }
  var url: URL? { get }
  var error: NetworkError? { get set }
  func fetchHitsList() -> AnyPublisher<HitsList, NetworkError>
}

class NetworkManager: NetworkManagerProtocol {
  var decoder: JSONDecoder
  
  var url: URL?
  
  var error: NetworkError?
  
  init(decoder: JSONDecoder = JSONDecoder(),
       url: URL) {
    self.decoder = decoder
    self.url = url
  }
  
  func fetchHitsList() -> AnyPublisher<HitsList, NetworkError> {
    guard let url = url else { return Empty<HitsList, NetworkError>()
      .eraseToAnyPublisher() }
    return URLSession.shared.dataTaskPublisher(for: url)
      .map{$0.data}
      .decode(type: HitsList.self, decoder: decoder)
      .mapError { error -> NetworkError in
        self.error = error as? NetworkError
        return NetworkError.dataParseError
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}
