//
//  AchievementsPresenterTests.swift
//  StashTests
//
//  Created by Varun Mamindla on 4/19/21.
//

import XCTest
@testable import Stash

final class AchievementsPresenterTests: XCTestCase {
    
    var presenter: AchievementsPresenter!
    var interactorMock: AchievementsInteractorMock!
    var viewMock: AchievementsViewMock!
    
    override func setUp() {
        super.setUp()
        interactorMock = AchievementsInteractorMock()
        viewMock = AchievementsViewMock()
        presenter = AchievementsPresenter(view: viewMock, interactor: interactorMock)
    }
    
    override func tearDown() {
        super.tearDown()
        interactorMock = nil
        viewMock = nil
        presenter = nil
    }

    func testOnViewWillAppear() {
        // When
        presenter.onViewWillAppear()
        // Then
        XCTAssertTrue(viewMock.showIndicatorCalled)
        XCTAssertTrue(viewMock.hideIndicatorCalled)
        XCTAssertFalse(viewMock.updateViewCalled)
    }
    
    func testOnViewWillAppearWithSuccess() {
        // Given
        let expectedTitle = "Smart Investing"
        // when
        interactorMock.isResponseWithFailure = false
        presenter.onViewWillAppear()
        // Then
        XCTAssertTrue(viewMock.showIndicatorCalled)
        XCTAssertTrue(viewMock.hideIndicatorCalled)
        XCTAssertTrue(viewMock.updateViewCalled)
        XCTAssertEqual(presenter.achievemnetsUIModel.count, 1)
        XCTAssertEqual(presenter.title, expectedTitle)
    }
    
    func testNoOfRows() {
        // Given
        let expectedRows = 1
        // when
        interactorMock.isResponseWithFailure = false
        presenter.onViewWillAppear()
        let actualRows = presenter.noOfRows
        // Then
        XCTAssertEqual(actualRows, expectedRows)
    }
    
    func testAcievementUIModel() {
        // Given
        let expectedCompletedPoints = "10pts"
        let expectedTotalPoints = "50pts"
        // When
        interactorMock.isResponseWithFailure = false
        presenter.onViewWillAppear()
        let actualUIModel = presenter.achievementUIModel(for: 0)
        
        // Then
        XCTAssertEqual(actualUIModel.totalPoints, expectedTotalPoints)
        XCTAssertEqual(actualUIModel.completedPoints, expectedCompletedPoints)
        XCTAssertEqual(actualUIModel.completedPoints, expectedCompletedPoints)
        XCTAssertTrue(actualUIModel.isAccessible)
        XCTAssertEqual(actualUIModel.progressBarFill, 0.2)
    }
}
