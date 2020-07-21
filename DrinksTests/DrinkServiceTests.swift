//
//  DrinkServiceTests.swift
//  DrinksTests
//
//  Created by Wu, Kevin on 7/16/20.
//  Copyright © 2020 MeiChi. All rights reserved.
//

import XCTest
@testable import Drinks

class DrinkServiceTests: XCTestCase {
    var systemUnderTest:DrinkService!

    override func setUp() {
        self.systemUnderTest = DrinkService()
    }

    override func tearDown() {
        self.systemUnderTest = nil
    }

    func testAPI_returnsSeccessfulResult() {
        //Given
        var drinks:[Drink]!
        var error: Error?
        
        let promise = expectation(description: "Completion handler is invoked")
        
        //When
        self.systemUnderTest.getDrinks(completion:  {data, shouldntHappen in
            drinks = data
            error = shouldntHappen
            promise.fulfill()
        })
        wait(for: [promise], timeout: 5)
        
        //Then
        XCTAssertNotNil(drinks)
        XCTAssertNil(error)
        
    }


}
