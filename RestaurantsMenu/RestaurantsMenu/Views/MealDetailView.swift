//
//  MealDetailView.swift
//  RestaurantsMenu
//
//  Created by Sahith D on 5/23/24.
//
import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @StateObject private var viewModel = RecipeViewModel()
    
    var body: some View {
        ScrollView {
            if let mealDetail = viewModel.mealDetail {
                VStack(alignment: .leading) {
                    if let thumbnail = mealDetail.thumbnail, let url = URL(string: thumbnail) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    
                    Text(mealDetail.name)
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 10)
                    
                    if let category = mealDetail.category {
                        Text("Category: \(category)")
                            .font(.title3)
                            .padding(.top, 5)
                    }
                    
                    if let area = mealDetail.area {
                        Text("Area: \(area)")
                            .font(.title3)
                            .padding(.top, 5)
                    }
                    
                    if let tags = mealDetail.tags {
                        Text("Tags: \(tags)")
                            .font(.title3)
                            .padding(.top, 5)
                    }
                    
                    Divider().padding(.vertical, 10)
                    
                    Text("Ingredients")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 5)
                    
                    if mealDetail.ingredients.isEmpty {
                        Text("No ingredients available.")
                            .foregroundColor(.gray)
                            .padding(.bottom, 5)
                    } else {
                        ForEach(Array(zip(mealDetail.ingredients, mealDetail.measurements)), id: \.0) { ingredient, measurement in
                            Text("\(ingredient): \(measurement)")
                                .padding(.bottom, 2)
                        }
                    }
                    
                    Divider().padding(.vertical, 10)
                    
                    Text("Instructions")
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 5)
                    
                    Text(mealDetail.instructions)
                        .padding(.bottom, 20)
                    
                    if let youtube = mealDetail.youtube, let url = URL(string: youtube) {
                        Link("Watch on YouTube", destination: url)
                            .font(.title2)
                            .foregroundColor(.blue)
                            .padding(.top, 10)
                    }
                }
                .padding()
            } else {
                Text("No details available.")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .navigationTitle("Meal Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemBackground))
        .onAppear {
            viewModel.fetchMealDetail(id: mealID)
        }
    }
    
    static func sampleMealID() -> String {
        return "52893"    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(mealID: MealDetailView.sampleMealID())
    }
}



