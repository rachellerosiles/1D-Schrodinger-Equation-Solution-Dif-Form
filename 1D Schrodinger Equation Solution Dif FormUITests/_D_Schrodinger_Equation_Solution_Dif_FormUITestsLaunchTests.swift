//
//  _D_Schrodinger_Equation_Solution_Dif_FormUITestsLaunchTests.swift
//  1D Schrodinger Equation Solution Dif FormUITests
//
//  Created by PHYS 440 Rachelle on 3/8/24.
//

import XCTest

final class _D_Schrodinger_Equation_Solution_Dif_FormUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
