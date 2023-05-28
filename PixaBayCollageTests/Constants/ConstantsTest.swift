//
//  ConstantsTest.swift
//  PixaBayCollageTests
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

@testable import PixaBayCollage
import XCTest

final class ConstantsTest: XCTestCase {

    func testExample() throws {
      XCTAssertEqual(Constants.baseUrl, "https://pixabay.com/api/?key=24768596-fba1b9ab1f9e60f7ff62a253e&q=")
      XCTAssertEqual(Endpoint.nature, "nature&image_type=photo&per_page=200")
    }
}
