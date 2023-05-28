//
//  NetworkManager.swift
//  PixaBayCollageTests
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

import Combine
@testable import PixaBayCollage
import XCTest

final class NetworkManagerTest: XCTestCase {
  var sut: NetworkManagerProtocol?

  override func tearDownWithError() throws {
    sut = nil
  }
  
  func testWhenCorrectUrlGiven_ShouldFetchResults() {
    
    var cancellables = Set<AnyCancellable>()
    let expectation = XCTestExpectation(description: "HitListFetched")
    sut = MockNetworkManager()
    let _ = sut?.fetchHitsList()
      .receive(on: DispatchQueue.main)
      .sink { _ in } receiveValue: { hitsList in
        XCTAssertNotNil(hitsList)
        expectation.fulfill()
      }
      .store(in: &cancellables)
    
    wait(for: [expectation], timeout: 3)
  }
  
  func testWhenCorrectUrlGiven_ShouldNotFetchResultsAndGiveUrlError() {
    
    var cancellables = Set<AnyCancellable>()
    let expectation = XCTestExpectation(description: "HitListNotFetchedWithUrlError")
    sut = MockNetworkManager()
    sut?.error = .urlError
    let _ = sut?.fetchHitsList()
      .receive(on: DispatchQueue.main)
      .sink { _ in } receiveValue: { hitsList in
        XCTAssertNil(hitsList)
        expectation.fulfill()
      }
      .store(in: &cancellables)
    XCTAssertEqual(sut?.error!, .urlError)
    expectation.fulfill()
    wait(for: [expectation], timeout: 3)
  }
}

