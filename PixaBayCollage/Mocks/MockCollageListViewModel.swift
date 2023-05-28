//
//  MockCollageListViewModel.swift
//  PixaBayCollageTests
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

import Foundation

class MockCollageListViewModel: CollageListViewModelBase {
  
  // MARK: Properties
  enum UseCase {
    case success
    case failure
  }

  var usecase: UseCase
  
  init(hitsList: HitsList = HitsList(hits: []), error: NetworkError? = nil, networkManager: NetworkManagerProtocol,
       usecase: UseCase) {
    self.usecase = usecase
    super.init(hitsList: hitsList, error: error, networkManager: networkManager)
  }
  
  // MARK: Methods
  
  override func fetchHitsList() {
    if usecase == .success {
      hitsList = HitsList(hits: [Hit(tags: "tree, sunset, clouds", previewURL: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_150.jpg", webformatURL: "https://pixabay.com/get/gebc1c30dc78d9c5628d43e343da17dbeaafbaa40232a5d1958995c176cf416be9e2924a7e91e40cd6583891ae3eb4c8e_640.jpg"), Hit(tags: "flowers, meadow, sunlight", previewURL: "https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_150.jpg", webformatURL: "https://pixabay.com/get/g0050b151bb9100e4f8a3f59855c1334504f42cbd537ae46aaa53e394c729ab9c01235e3da892b6facc1fdfdd27486edb_640.jpg")])
    } else if usecase == .failure {
      self.error = NetworkError.dataParseError
    }
  }
}
