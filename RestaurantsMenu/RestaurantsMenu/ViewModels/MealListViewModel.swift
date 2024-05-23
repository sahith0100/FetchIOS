//
//  MealListViewModel.swift
//  RestaurantsMenu
//
//  Created by Sahith D on 5/24/24.
//

import Foundation
import Combine

class MealListViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    private var cancellables = Set<AnyCancellable>()
    
    func fetchMeals() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: MealsResponse.self, decoder: JSONDecoder())
            .map { $0.meals }
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.meals = $0 }
            .store(in: &cancellables)
    }
}

