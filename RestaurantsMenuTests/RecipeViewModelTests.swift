//
//  RecipeViewModelTests.swift
//  RestaurantsMenuTests
//
//  Created by Sahith D on 5/24/24.
//

import XCTest
import Combine
@testable import RestaurantsMenu

class RecipeViewModelTests: XCTestCase {

    var viewModel: RecipeViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        viewModel = RecipeViewModel()
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testFetchMeals() {
        let expectation = XCTestExpectation(description: "Fetch meals")

        viewModel.$meals.dropFirst().sink { meals in
            XCTAssertFalse(meals.isEmpty)
            expectation.fulfill()
        }.store(in: &cancellables)

        viewModel.fetchMeals()

        wait(for: [expectation], timeout: 5.0)
    }

    func testFetchMealDetail() {
        let expectation = XCTestExpectation(description: "Fetch meal detail")

        viewModel.$mealDetail.dropFirst().sink { mealDetail in
            XCTAssertNotNil(mealDetail)
            XCTAssertEqual(mealDetail?.id, "53049")
            expectation.fulfill()
        }.store(in: &cancellables)

        viewModel.fetchMealDetail(id: "53049")

        wait(for: [expectation], timeout: 5.0)
    }
}

