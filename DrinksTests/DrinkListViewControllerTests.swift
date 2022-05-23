//
//  DrinkListViewControllerTests.swift
//  DrinksTests
//
//  Created by Wu, Kevin on 7/16/20.
//  Copyright © 2020 MeiChi. All rights reserved.
//

import XCTest
@testable import Drinks

class DrinkListViewControllerTests: XCTestCase {
    var systemUnderTest: DrinkListViewController!

    override func setUp() {
        super.setUp()
            
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
            self.systemUnderTest = navigationController.topViewController as? DrinkListViewController
            
            UIApplication.shared.windows
                .filter{ $0.isKeyWindow }
                .first!
                .rootViewController = self.systemUnderTest
            
            XCTAssertNotNil(navigationController.view)
            XCTAssertNotNil(self.systemUnderTest.view)
            
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTableView_loadsDrinks() throws {
        //Given
        let mockDrinkService = MockDrinkService()
        let mockDrinks = [
            Drink(name: "DrinkA", content: "ContentA", cal: 400, price: 1.00, imageUrl: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/1b07b069215481.5b793ea27b52f.jpg"),
            Drink(name: "DrinkB", content: "ContentB", cal: 500, price: 2.00, imageUrl: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/8c25a869215481.5b793eb5e5738.jpg"),
            Drink(name: "DrinkC", content: "ContentC", cal: 600, price: 3.00, imageUrl: "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b8d39469215481.5b793ebec7418.jpg"),
        ]
        mockDrinkService.mockDrinks = mockDrinks
        
        self.systemUnderTest.viewDidLoad()
        self.systemUnderTest.drinkService = mockDrinkService
        
        //When
        self.systemUnderTest.viewWillAppear(false)
        
        
        //Then
        XCTAssertEqual(mockDrinks.count, self.systemUnderTest.drinks.count)
        XCTAssertEqual(mockDrinks.count, self.systemUnderTest.tableView.numberOfRows(inSection: 0))
        
    }

    class MockDrinkService: DrinkService {
        var mockDrinks: [Drink]?
        var mockError: Error?
        
        override func getDrinks(completion: @escaping ([Drink]?, Error?) -> ()) {
            completion(mockDrinks, mockError)
        }
    }

}


