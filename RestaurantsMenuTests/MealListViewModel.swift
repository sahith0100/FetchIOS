//
//  MealListViewModel.swift
//  RestaurantsMenuTests
//
//  Created by Sahith D on 5/25/24.
//

import XCTest
import Combine
@testable import RestaurantsMenu

class MealListViewModelTests: XCTestCase {

    var viewModel: MealListViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        viewModel = MealListViewModel()
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testFetchMeals() {
        let expectation = XCTestExpectation(description: "Fetch meals")
        
        viewModel.$meals
            .dropFirst()
            .sink { meals in
                XCTAssertGreaterThan(meals.count, 0)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel.fetchMeals()
        
        wait(for: [expectation], timeout: 5.0)
    }
}

