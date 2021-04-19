//
//  AchievementsViewControllerTests.swift
//  StashTests
//
//  Created by Varun Mamindla on 4/19/21.
//

import XCTest
import UIKit
@testable import Stash

final class AchievementsViewControllerTests: XCTestCase {
    var viewController: AchievementsViewController!
    var presenterMock: AchievementsPresenterMock!
    
    override func setUp() {
        super.setUp()
        presenterMock = AchievementsPresenterMock()
        viewController = DefaultNib.viewController()
        viewController.presenter = presenterMock
        viewController.loadView()
    }
    
    override func tearDown() {
        super.tearDown()
        presenterMock = nil
        viewController = nil
    }
    
    func testViewDidLoad() {
        viewController.viewDidLoad()
        XCTAssertNotNil(viewController.view)
    }
    
    func testViewWillAppear() {
        viewController.viewDidLoad()
        viewController.viewWillAppear(true)
        XCTAssertTrue(presenterMock.viewWillAppearCalled)
    }
    
    func testUpdateView() {
        viewController.viewDidLoad()
        viewController.viewWillAppear(true)
        viewController.updateView()
        XCTAssertEqual(viewController.title, "Smart Investing")
    }
    
    func testTableViewHasDelegate() {
        viewController.viewDidLoad()
        XCTAssertNotNil(viewController.achievementsTableView.delegate)
    }
    
    func testTableViewHasDataSource() {
        viewController.viewDidLoad()
        XCTAssertNotNil(viewController.achievementsTableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        viewController.viewDidLoad()
        XCTAssertTrue(viewController.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:cellForRowAt:))))
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        viewController.viewDidLoad()
        XCTAssertTrue(viewController.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(viewController.responds(to: #selector(viewController.tableView(_:willDisplay:forRowAt:))))
    }
    
    func testTableViewCellHasReuseIdentifier() {
        viewController.viewDidLoad()
        let cell = viewController.tableView(viewController.achievementsTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? AchievementTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "AchievementCellIdentifier"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    func testNoOfRowsInTableView() {
        viewController.viewDidLoad()
        let rows = viewController.tableView(viewController.achievementsTableView, numberOfRowsInSection: 0)
        XCTAssertGreaterThan(rows, 0)
    }
    
    func testTableViewCellForIndexPath() {
        // Given
        let expectedModel = presenterMock.achievementUIModel(for: 0)
        // When
        viewController.viewDidLoad()
        let cell = viewController.tableView(viewController.achievementsTableView, cellForRowAt: IndexPath(row: 1, section: 0)) as? AchievementTableViewCell
        // Then
        XCTAssertEqual(cell?.levelLabel.text, expectedModel.level)
        XCTAssertEqual(cell?.completedPointsLabel.text, "10pts")
        XCTAssertEqual(cell?.alpha, 1.0)
    }
}
