//
//  MealDetailTests.swift
//  RestaurantsMenuTests
//
//  Created by Sahith D on 5/25/24.
//

import XCTest
@testable import RestaurantsMenu

class MealDetailTests: XCTestCase {

    func testMealDetailDecoding() throws {
        let json = """
        {
            "idMeal": "52928",
            "strMeal": "BeaverTails",
            "strCategory": "Dessert",
            "strArea": "Canadian",
            "strInstructions": "In the bowl of a stand mixer, add warm water, a big pinch of sugar and yeast...",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg",
            "strTags": "Treat,Pudding,Speciality",
            "strYoutube": "https://www.youtube.com/watch?v=2G07UOqU2e8",
            "strIngredient1": "Water",
            "strIngredient2": "Yeast",
            "strIngredient3": "Sugar",
            "strIngredient4": "Milk",
            "strIngredient5": "Butter",
            "strIngredient6": "Eggs",
            "strIngredient7": "Salt",
            "strIngredient8": "Flour",
            "strIngredient9": "Oil",
            "strIngredient10": "Lemon",
            "strIngredient11": "Sugar",
            "strIngredient12": "Cinnamon",
            "strMeasure1": "1/2 cup ",
            "strMeasure2": "2 parts ",
            "strMeasure3": "1/2 cup ",
            "strMeasure4": "1/2 cup ",
            "strMeasure5": "6 tblsp",
            "strMeasure6": "2",
            "strMeasure7": "1 ½ tsp",
            "strMeasure8": "2-1/2 cups",
            "strMeasure9": "for frying",
            "strMeasure10": "garnish"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let mealDetail = try decoder.decode(MealDetail.self, from: json)

        XCTAssertEqual(mealDetail.id, "52928")
        XCTAssertEqual(mealDetail.name, "BeaverTails")
        XCTAssertEqual(mealDetail.category, "Dessert")
        XCTAssertEqual(mealDetail.area, "Canadian")
        XCTAssertEqual(mealDetail.instructions, "In the bowl of a stand mixer, add warm water, a big pinch of sugar and yeast...")
        XCTAssertEqual(mealDetail.thumbnail, "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg")
        XCTAssertEqual(mealDetail.tags, "Treat,Pudding,Speciality")
        XCTAssertEqual(mealDetail.youtube, "https://www.youtube.com/watch?v=2G07UOqU2e8")
        XCTAssertEqual(mealDetail.ingredients, ["Water", "Yeast", "Sugar", "Milk", "Butter", "Eggs", "Salt", "Flour", "Oil", "Lemon", "Sugar", "Cinnamon"])
        XCTAssertEqual(mealDetail.measurements, ["1/2 cup ", "2 parts ", "1/2 cup ", "1/2 cup ", "6 tblsp", "2", "1 ½ tsp", "2-1/2 cups", "for frying", "garnish"])
    }
    
    func testMealDetailResponseDecoding() throws {
        let json = """
        {
            "meals": [{
                "idMeal": "52928",
                "strMeal": "BeaverTails",
                "strCategory": "Dessert",
                "strArea": "Canadian",
                "strInstructions": "In the bowl of a stand mixer, add warm water, a big pinch of sugar and yeast...",
                "strMealThumb": "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg",
                "strTags": "Treat,Pudding,Speciality",
                "strYoutube": "https://www.youtube.com/watch?v=2G07UOqU2e8",
                "strIngredient1": "Water",
                "strIngredient2": "Yeast",
                "strIngredient3": "Sugar",
                "strIngredient4": "Milk",
                "strIngredient5": "Butter",
                "strIngredient6": "Eggs",
                "strIngredient7": "Salt",
                "strIngredient8": "Flour",
                "strIngredient9": "Oil",
                "strIngredient10": "Lemon",
                "strIngredient11": "Sugar",
                "strIngredient12": "Cinnamon",
                "strMeasure1": "1/2 cup ",
                "strMeasure2": "2 parts ",
                "strMeasure3": "1/2 cup ",
                "strMeasure4": "1/2 cup ",
                "strMeasure5": "6 tblsp",
                "strMeasure6": "2",
                "strMeasure7": "1 ½ tsp",
                "strMeasure8": "2-1/2 cups",
                "strMeasure9": "for frying",
                "strMeasure10": "garnish"
            }]
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let mealDetailResponse = try decoder.decode(MealDetailResponse.self, from: json)

        XCTAssertEqual(mealDetailResponse.meals?.count, 1)
        if let mealDetail = mealDetailResponse.meals?.first {
            XCTAssertEqual(mealDetail.id, "52928")
            XCTAssertEqual(mealDetail.name, "BeaverTails")
        }
    }
}

