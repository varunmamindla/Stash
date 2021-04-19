//
//  AchievementsInteractorTests.swift
//  StashTests
//
//  Created by Varun Mamindla on 4/18/21.
//

import XCTest
@testable import Stash

final class AchievementsInteractorTests: XCTestCase {
    var interactor: AchievementsInteractor!
    
    override func setUp() {
        super.setUp()
        interactor = AchievementsInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
        interactor = nil
    }

    func testFectchAchievementsData() {
        // Given
        let expectedTitle = "Smart Investing"
        
        // When
        interactor.fetchAchievemnts { result in
            // Then
            guard case let .success(model) = result else {
                XCTFail("fetch achievements info call is succeeded")
                return
            }
            XCTAssertNotNil(model)
            XCTAssertEqual(model?.title, expectedTitle)
        }
    }
}
