//
//  MealTests.swift
//  RestaurantsMenuTests
//
//  Created by Sahith D on 5/24/24.

import XCTest
@testable import RestaurantsMenu

class MealTests: XCTestCase {

    func testMealDecoding() throws {
        let json = """
        {
            "idMeal": "52772",
            "strMeal": "Teriyaki Chicken Casserole",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let meal = try decoder.decode(Meal.self, from: json)

        XCTAssertEqual(meal.id, "52772")
        XCTAssertEqual(meal.name, "Teriyaki Chicken Casserole")
        XCTAssertEqual(meal.thumbnail, "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg")
    }

    func testMealsResponseDecoding() throws {
        let json = """
        {
            "meals": [
                {
                    "idMeal": "52772",
                    "strMeal": "Teriyaki Chicken Casserole",
                    "strMealThumb": "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
                }
            ]
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let mealsResponse = try decoder.decode(MealsResponse.self, from: json)

        XCTAssertEqual(mealsResponse.meals.count, 1)
        XCTAssertEqual(mealsResponse.meals[0].id, "52772")
        XCTAssertEqual(mealsResponse.meals[0].name, "Teriyaki Chicken Casserole")
        XCTAssertEqual(mealsResponse.meals[0].thumbnail, "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg")
    }
}
