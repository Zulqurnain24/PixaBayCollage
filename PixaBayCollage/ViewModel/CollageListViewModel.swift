//
//  CollageListViewModel.swift
//  PixaBayCollage
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

import Combine
import Foundation

class CollageListViewModelBase: ObservableObject {
  @Published var hitsList: HitsList
  var error: NetworkError?
  let networkManager: NetworkManagerProtocol
  
  init(hitsList: HitsList = HitsList(hits: []),
       error: NetworkError? = nil,
       networkManager: NetworkManagerProtocol) {
    self.hitsList =  hitsList
    self.error = error
    self.networkManager = networkManager
  }
  
  func fetchHitsList() {}
}

class CollageListViewModel: CollageListViewModelBase {
  var cancellables = Set<AnyCancellable>()
  // Methods
  override func fetchHitsList() {
    let _ = networkManager.fetchHitsList()
      .receive(on: DispatchQueue.main)
      .sink { _ in } receiveValue: { hitsList in  self.hitsList = hitsList }
      .store(in: &cancellables)
  }
}
