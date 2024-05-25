//
//  MealListView.swift
//  RestaurantsMenu
//
//  Created by Sahith D on 5/23/24.
//
import SwiftUI
struct MealListView: View {
    @StateObject private var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.meals) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.id)) {
                    HStack {
                        AsyncImage(url: URL(string: meal.thumbnail)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .roundedImage()
                        
                        Text(meal.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding(.leading, 10)
                    }
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Desserts")
            .onAppear {
                viewModel.fetchMeals()
            }
            .background(Color(.systemGroupedBackground))
        }
    }
}
struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
