//
//  ScreenShotTest.swift
//  PixaBayCollageUITests
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

import XCTest

final class ScreenShotTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCollageListView() throws {
        // UI tests must launch the application that they test.
        let currentAppWindow = XCUIScreen.main
        let screenshot = currentAppWindow.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.lifetime = .keepAlways
        attachment.name = "Screenshot for CollageListView"
        add(attachment)
    }
}
