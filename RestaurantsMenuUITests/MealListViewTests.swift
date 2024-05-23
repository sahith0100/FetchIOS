//
//  MealListViewTests.swift
//  RestaurantsMenuUITests
//
//  Created by Sahith D on 5/24/24.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import RecipeBrowser

extension MealListView: Inspectable {}

class MealListViewTests: XCTestCase {
    
    func testMealListView() throws {
        let viewModel = RecipeViewModel()
        viewModel.meals = [
            Meal(id: "53049", name: "Apam balik", thumbnail: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"),
            Meal(id: "52893", name: "Apple & Blackberry Crumble", thumbnail: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")
        ]
        
        let view = MealListView()
        let list = try view.inspect().find(ViewType.List.self)
        XCTAssertEqual(try list.findAll(ViewType.Text.self).count, 2)
        XCTAssertEqual(try list.findAll(ViewType.Text.self)[0].string(), "Apam balik")
        XCTAssertEqual(try list.findAll(ViewType.Text.self)[1].string(), "Apple & Blackberry Crumble")
    }
}

