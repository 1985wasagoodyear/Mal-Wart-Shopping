//
//  Mal_WartUITests.swift
//  Created 8/3/20
//  Using Swift 5.0
// 
//  Copyright © 2020 yu. All rights reserved.
//
//  https://github.com/1985wasagoodyear
//

import XCTest

final class Mal_WartUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }
    
    func testCanEnter_BreadAisle() {
        let breadQuery = app.staticTexts["Bread Aisle"]
        XCTAssert(breadQuery.exists)
    }

    func testCanFind_CellWith_BreadInLabel() {
        let tablesQuery = app.tables
        let predicate = NSPredicate(format: "label CONTAINS %@", "Bread")
        let breadQuery = tablesQuery.cells.containing(predicate).firstMatch
        XCTAssert(breadQuery.exists)
    }
    
    func testCanFind_FirstBreadCell() {
        let breadQuery = app.buttons.matching(identifier: "Bread").firstMatch
        XCTAssert(breadQuery.exists)
    }
    
    func testCanFind_LastBreadCell() {
        let breadQuery = app.buttons.matching(identifier: "Pre-toasted").firstMatch
        app.swipeUp()
        XCTAssert(breadQuery.exists)
    }
    
    func testCanView_SugarLoaf_DetailsScreen() {
        // first-screen items
        let breadQuery = app.buttons.matching(identifier: "Bread").firstMatch
        let sugarLoafButton = app.buttons.matching(identifier: "Sugar Loaf").firstMatch
        // detail screen items
        let sugarLoafText = app.staticTexts["Sugar Loaf"]
        let sugarLoafImage = app.images["bread"]
        
        // assert the first-screen's items are present
        // and the details screen's items are not-yet visible
        XCTAssert(breadQuery.exists)
        XCTAssert(sugarLoafButton.exists)
        XCTAssertFalse(sugarLoafText.exists)
        XCTAssertFalse(sugarLoafImage.exists)
        
        // tap
        sugarLoafButton.tap()
        
        // wait for animations to finish
        let exists = NSPredicate(format: "exists == 1")
        expectation(for: exists, evaluatedWith: sugarLoafText, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        // assert that first-screen is gone
        // but the detail screen's elements now exist
        XCTAssertFalse(breadQuery.exists)
        XCTAssertFalse(sugarLoafButton.exists)
        XCTAssert(sugarLoafText.exists)
        XCTAssert(sugarLoafImage.exists)
    }

}
