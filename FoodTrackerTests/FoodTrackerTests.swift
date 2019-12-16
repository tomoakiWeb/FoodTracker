//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by 三浦　知明 on 2019/12/09.
//  Copyright © 2019 三浦　知明. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {

    func testMealInitializationSucceeds() {
        //Zero rating
        let zeroRatingMeal = Meal.init(name:"Zero", photo: nil ,rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Hightest positive rating
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    func testMealInitializationFails() {
        
        //Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large",photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        // Empty String
        let emptyStringMeal = Meal.init(name:"",photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    }

}
