//
//  AchievementsViewMock.swift
//  StashTests
//
//  Created by Varun Mamindla on 4/19/21.
//

@testable import Stash

final class AchievementsViewMock {
    var showIndicatorCalled = false
    var hideIndicatorCalled = false
    var updateViewCalled = false
}

extension AchievementsViewMock: AchievementsViewing {
    func showIndicator() {
        showIndicatorCalled = true
    }
    
    func hideIndicatior() {
        hideIndicatorCalled = true
    }
    
    func updateView() {
        updateViewCalled = true
    }
}
