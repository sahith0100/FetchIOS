//
//  MealDetailViewTests.swift
//  RestaurantsMenuUITests
//
//  Created by Sahith D on 5/24/24.
//

import XCTest

class MealDetailViewUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testMealDetailView() throws {
       
        let firstCell = app.tables.cells.element(boundBy: 0)
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: firstCell, handler: nil)
        waitForExpectations(timeout: 10, handler: nil)
        
        firstCell.tap()
        
        let mealDetailTitle = app.staticTexts["Meal Details"]
        XCTAssertTrue(mealDetailTitle.exists)
        
        
        let ingredientsLabel = app.staticTexts["Ingredients"]
        XCTAssertTrue(ingredientsLabel.exists)
        
        let instructionsLabel = app.staticTexts["Instructions"]
        XCTAssertTrue(instructionsLabel.exists)
        
        let firstIngredient = app.staticTexts["Water: 1/2 cup"]
        XCTAssertTrue(firstIngredient.exists)
    }
}
