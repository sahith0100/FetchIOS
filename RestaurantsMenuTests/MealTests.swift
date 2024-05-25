//
//  MealTests.swift
//  RestaurantsMenuTests
//
//  Created by Sahith D on 5/24/24.
//
import XCTest
@testable import RestaurantsMenu

class MealTests: XCTestCase {

    func testMealDecoding() {
        let json = """
        {
            "idMeal": "53049",
            "strMeal": "Apam balik",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg"
        }
        """
        let data = json.data(using: .utf8)!
        let meal = try! JSONDecoder().decode(Meal.self, from: data)
        
        XCTAssertEqual(meal.id, "53049")
        XCTAssertEqual(meal.name, "Apam balik")
        XCTAssertEqual(meal.thumbnail, "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    }
}

class MealDetailTests: XCTestCase {

    func testMealDetailDecoding() {
        let json = """
        {
            "idMeal": "53049",
            "strMeal": "Apam balik",
            "strInstructions": "Mix all ingredients and cook.",
            "strIngredient1": "Flour",
            "strIngredient2": "Sugar",
            "strMeasure1": "1 cup",
            "strMeasure2": "2 tbsp"
        }
        """
        let data = json.data(using: .utf8)!
        let mealDetail = try! JSONDecoder().decode(MealDetail.self, from: data)
        
        XCTAssertEqual(mealDetail.id, "53049")
        XCTAssertEqual(mealDetail.name, "Apam balik")
        XCTAssertEqual(mealDetail.instructions, "Mix all ingredients and cook.")
        XCTAssertEqual(mealDetail.ingredients, ["Flour", "Sugar"])
        XCTAssertEqual(mealDetail.measurements, ["1 cup", "2 tbsp"])
    }
}

