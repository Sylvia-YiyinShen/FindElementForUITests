//
//  FindElementForUITestsUITests.swift
//  FindElementForUITestsUITests
//
//  Created by Zhihui Sun on 25/5/19.
//  Copyright © 2019 Sylvia Shen. All rights reserved.
//

import XCTest

class FindElementForUITestsUITests: XCTestCase {

    private let application = XCUIApplication()
    private var utilities: UITestsUtilities?
    
    override func setUp() {
        continueAfterFailure = false
        application.launch()
        utilities = UITestsUtilities(testCase: self, app: application)
    }
    

    func testFindElements() {
        
        let textView = XCUIApplication().otherElements.containing(.navigationBar, identifier:"Home").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textView.tap()
        textView.tap()
        
        // check UILabel
        let label = application.staticTexts["This is a label"]
        XCTAssert(label.exists)
        
        utilities?.waitForElementToAppear(element: label)
        
        // check TableViewCell
        let labelInCell = application.staticTexts["Row 0"]
        utilities?.waitForElementToAppear(element: labelInCell)
        
        // check NavigationBar
        let navivationBar = application.navigationBars["Home"]
        utilities?.waitForElementToAppear(element: navivationBar)
        
        // check UIButton
        let button = application.buttons["Tap!"]
        utilities?.waitForElementToAppear(element: button)
        
        // check TableView
        let tableView = application.tables.element(boundBy: 0)
        utilities?.waitForElementToAppear(element: tableView)
        
        // check TextView
        utilities?.waitForElementToAppear(element: application.textViews.element(matching: .textView, identifier: "greyTextView"))
        
        // check a UIButton by identifier
        utilities?.waitForElementToAppear(element: application.buttons["buttonWithIdentifier"])

    }
}
