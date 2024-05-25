//
//  Meal.swift
//  RestaurantsMenu
//
//  Created by Sahith D on 5/23/24.
//
import Foundation

struct Meal: Identifiable, Codable {
    let id: String
    let name: String
    let thumbnail: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
}

struct MealsResponse: Codable {
    let meals: [Meal]
}
