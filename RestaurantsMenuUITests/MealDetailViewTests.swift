//
//  MealDetailViewTests.swift
//  RestaurantsMenuUITests
//
//  Created by Sahith D on 5/24/24.
//

import XCTest
import SwiftUI
//import ViewInspector
@testable import RestaurantsMenu

extension MealDetailView: Inspectable {}

class MealDetailViewTests: XCTestCase {
    
    func testMealDetailView() throws {
        let viewModel = RecipeViewModel()
        viewModel.mealDetail = MealDetail(id: "53049", name: "Apam balik", instructions: "Mix all ingredients and cook.", ingredients: ["Flour", "Sugar"], measurements: ["1 cup", "2 tbsp"])
        
        let view = MealDetailView(mealID: "53049")
        let detailView = try view.inspect().find(ViewType.VStack.self)
        XCTAssertEqual(try detailView.findAll(ViewType.Text.self)[0].string(), "Apam balik")
        XCTAssertEqual(try detailView.findAll(ViewType.Text.self)[1].string(), "Ingredients")
        XCTAssertEqual(try detailView.findAll(ViewType.Text.self)[2].string(), "Flour: 1 cup")
        XCTAssertEqual(try detailView.findAll(ViewType.Text.self)[3].string(), "Sugar: 2 tbsp")
        XCTAssertEqual(try detailView.findAll(ViewType.Text.self)[4].string(), "Instructions")
        XCTAssertEqual(try detailView.findAll(ViewType.Text.self)[5].string(), "Mix all ingredients and cook.")
    }
}

