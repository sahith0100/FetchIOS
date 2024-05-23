//
//  RecipeViewModel.swift
//  RestaurantsMenu
//
//  Created by Sahith D on 5/23/24.
//

import Foundation
import Combine

class RecipeViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var mealDetail: MealDetail?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchMeals() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            
            self.meals = [
                Meal(id: "1", name: "Dummy Meal 1", thumbnail: ""),
                Meal(id: "2", name: "Dummy Meal 2", thumbnail: "")
            ]
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealsResponse.self, decoder: JSONDecoder())
            .map { $0.meals }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching meals: \(error)")
                    self.meals = [
                        Meal(id: "1", name: "Dummy Meal 1", thumbnail: ""),
                        Meal(id: "2", name: "Dummy Meal 2", thumbnail: "")
                    ]
                }
            }, receiveValue: { [weak self] meals in
                self?.meals = meals.sorted { $0.name < $1.name }
            })
            .store(in: &cancellables)
    }
    
    func fetchMealDetail(id: String) {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {
            self.mealDetail = MealDetail()
            return
        }
        
        print("Fetching meal detail for ID: \(id)")
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealDetailResponse.self, decoder: JSONDecoder())
            .map { $0.meals?.first }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching meal detail: \(error)")
                    self.mealDetail = MealDetail()
                }
            }, receiveValue: { [weak self] mealDetail in
                print("Fetched meal detail: \(String(describing: mealDetail))")
                self?.mealDetail = mealDetail ?? MealDetail()
            })
            .store(in: &cancellables)
    }
}
