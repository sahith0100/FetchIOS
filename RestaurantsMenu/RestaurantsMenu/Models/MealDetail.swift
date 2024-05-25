//
//  MealDetail.swift
//  RestaurantsMenu
//
//  Created by Sahith D on 5/23/24.
//
import Foundation

struct MealDetail: Codable {
    let id: String
    let name: String
    let category: String?
    let area: String?
    let instructions: String
    let thumbnail: String?
    let tags: String?
    let youtube: String?
    let ingredients: [String]
    let measurements: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case tags = "strTags"
        case youtube = "strYoutube"
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? "N/A"
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? "No Name"
        category = try container.decodeIfPresent(String.self, forKey: .category)
        area = try container.decodeIfPresent(String.self, forKey: .area)
        instructions = try container.decodeIfPresent(String.self, forKey: .instructions) ?? "No Instructions"
        thumbnail = try container.decodeIfPresent(String.self, forKey: .thumbnail)
        tags = try container.decodeIfPresent(String.self, forKey: .tags)
        youtube = try container.decodeIfPresent(String.self, forKey: .youtube)
        
        var ingredients: [String] = []
        var measurements: [String] = []
        
        for index in 1...20 {
            let ingredientKey = CodingKeys(stringValue: "strIngredient\(index)")!
            let measurementKey = CodingKeys(stringValue: "strMeasure\(index)")!
            
            if let ingredient = try container.decodeIfPresent(String.self, forKey: ingredientKey)?.trimmingCharacters(in: .whitespacesAndNewlines), !ingredient.isEmpty {
                ingredients.append(ingredient)
            }
            if let measurement = try container.decodeIfPresent(String.self, forKey: measurementKey)?.trimmingCharacters(in: .whitespacesAndNewlines), !measurement.isEmpty {
                measurements.append(measurement)
            }
        }
        
        self.ingredients = ingredients
        self.measurements = measurements
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(category, forKey: .category)
        try container.encode(area, forKey: .area)
        try container.encode(instructions, forKey: .instructions)
        try container.encode(thumbnail, forKey: .thumbnail)
        try container.encode(tags, forKey: .tags)
        try container.encode(youtube, forKey: .youtube)
        
        for (index, ingredient) in ingredients.enumerated() {
            let key = CodingKeys(stringValue: "strIngredient\(index + 1)")!
            try container.encode(ingredient, forKey: key)
        }
        
        for (index, measurement) in measurements.enumerated() {
            let key = CodingKeys(stringValue: "strMeasure\(index + 1)")!
            try container.encode(measurement, forKey: key)
        }
    }
    
    init(id: String = "N/A", name: String = "No Name", category: String? = nil, area: String? = nil,
         instructions: String = "No Instructions", thumbnail: String? = nil, tags: String? = nil,
         youtube: String? = nil, ingredients: [String] = ["Ingredient 1", "Ingredient 2", "Ingredient 3"],
         measurements: [String] = ["1 cup", "2 tbsp", "3 oz"]) {
        self.id = id
        self.name = name
        self.category = category
        self.area = area
        self.instructions = instructions
        self.thumbnail = thumbnail
        self.tags = tags
        self.youtube = youtube
        self.ingredients = ingredients
        self.measurements = measurements
    }
}

struct MealDetailResponse: Codable {
    let meals: [MealDetail]?
}






