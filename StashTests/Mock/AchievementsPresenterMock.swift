//
//  AchievementsPresenterMock.swift
//  StashTests
//
//  Created by Varun Mamindla on 4/19/21.
//

@testable import Stash

final class AchievementsPresenterMock {
    var viewWillAppearCalled = false
}

extension AchievementsPresenterMock: AchievementsPresenting {
    var title: String? {
        return "Smart Investing"
    }
    
    var noOfRows: Int {
        return 1
    }
    
    func onViewWillAppear() {
        viewWillAppearCalled = true
    }
    
    func achievementUIModel(for index: Int) -> AchievementViewState {
        let model = Achievement(achievementId: 1, level: "1", progress: 10, total: 50, imageURL: "", isAcessible: true)
        return AchievementUIModel(model: model)
    }
}
