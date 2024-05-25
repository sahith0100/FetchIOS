//
//  MealListViewTests.swift
//  RestaurantsMenuUITests
//
//  Created by Sahith D on 5/24/24.
//
import XCTest

class MealListViewUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testMealListView() throws {
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: firstCell, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertTrue(firstCell.exists)
    
        firstCell.tap()
    
        let mealDetailTitle = app.staticTexts["Meal Details"]
        XCTAssertTrue(mealDetailTitle.exists)
        
        let ingredientsLabel = app.staticTexts["Ingredients"]
        XCTAssertTrue(ingredientsLabel.exists)
        
        let instructionsLabel = app.staticTexts["Instructions"]
        XCTAssertTrue(instructionsLabel.exists)
    }
}

