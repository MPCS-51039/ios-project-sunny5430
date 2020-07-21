//
//  DrinkTest.swift
//  DrinksTests
//
//  Created by Wu, Kevin on 7/16/20.
//  Copyright © 2020 MeiChi. All rights reserved.
//

import XCTest
@testable import Drinks

class DrinkTest: XCTestCase {


    func testDrinkDebugDescription() {
        
        //Given
        let subjectUnderTest = Drink(
            name: "Test Drink",
            content: "Lots of bobas",
            cal: 190,
            price: 8.56,
            imageUrl: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/f3a6a169215481.5b793e9fdc334.jpg"
        )
        
        //When
        let actualValue = subjectUnderTest.debugDescription
        
        //Then
        let expectedValue = "Drink(name: Test Drink, content: Lots of bobas, price: 8.56)"
        XCTAssertEqual(actualValue, expectedValue)
    }

    
}
